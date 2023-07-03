import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';



enum TableStatus{idle,loading,ready,error}

enum ItemType{
  beer, coffee, nation, blood, none;
  String get asString => '$name';

  List<String> get columns => this == coffee? ["Nome", "Origem", "Tipo"] :
                              this == beer? ["Nome", "Estilo", "IBU"]:
                              this == nation? ["Nacionalidade", "Linguagem", "Capital"]:
                              this == blood? ["Tipo", "Fator RH", "Grupo"]:
                              [] ;

  List<String> get properties => this == coffee? ["blend_name","origin","variety"] :
                              this == beer? ["name","style","ibu"]:
                              this == nation? ["nationality","language", "capital"]:
                              this == blood? ["type","rh_factor", "group"]:
                              [] ;

}


var estadoAplicativo = {
  'status':TableStatus.idle,
  "dataObjects": [],
  'itemType': ItemType.none
};


class DataService{
  final ValueNotifier<Map<String,dynamic>> tableStateNotifier = ValueNotifier({
                              'status':TableStatus.idle,
                              'dataObjects':[],
                              'itemType': ItemType.none
                            });


  static const maxItems = 15;
  static const minItems = 5;
  static const defautItems = 10;

  int _querySize = defautItems;

  void setQuerySize(int newSize) {
    _querySize = newSize <= 0 ? minItems: newSize >= maxItems? maxItems: newSize;
  }
  
  int get querySize => _querySize;


  void carregar(index){
    final params = [ItemType.coffee, ItemType.beer, ItemType.nation, ItemType.blood];
    carregarPorTipo(params[index]);
  }


  Uri montarUri(ItemType type){
    return Uri(
      scheme: 'https',
      host: 'random-data-api.com',
      path: 'api/${type.asString}/random_${type.asString}',
      queryParameters: {'size': '$_querySize'}
    );
  }


  Future<List<dynamic>> acessarApi(Uri uri) async{
    var jsonString = await http.read(uri);
    var json = jsonDecode(jsonString);
    json = [...tableStateNotifier.value['dataObjects'], ...json];
    return json;
  }

  void emitirEstadoCarregando(ItemType type){
    tableStateNotifier.value = {
      'status': TableStatus.loading,
      'dataObjects': [],
      'propertyNames': type.properties,
      'itemType': type
    };
  }


  void emitirEstadoPronto(ItemType type, var json){
    tableStateNotifier.value = {
      'itemType': type,
      'status': TableStatus.ready,
      'dataObjects': json,
      'propertyNames': type.properties, // Update the key to 'propertyNames'
      'columnNames': type.columns
    };
  }


  bool temRequisicaoEmCurso() => tableStateNotifier.value['status'] == TableStatus.loading;
  bool mudouTipoDeItemRequisitado(ItemType type) => tableStateNotifier.value['itemType'] != type;


  void carregarPorTipo(ItemType type) async{
    //ignorar solicitação se uma requisição já estiver em curso
    if (temRequisicaoEmCurso()) return;
    if (mudouTipoDeItemRequisitado(type)){
      emitirEstadoCarregando(type);
    }

    var uri = montarUri(type);
    var json = await acessarApi(uri);
    emitirEstadoPronto(type, json);
  }

}
