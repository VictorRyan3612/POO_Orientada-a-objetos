import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../util/ordenador.dart';
import 'models.dart';


enum TableStatus{idle,loading,ready,error}

enum ItemType{
  coffee, beer, nation, blood, device, none;
  String get asString => '$name';

  String get tipoNomes{
    return
      this == coffee? "Cafés":
      this == beer? "Cervejas":
      this == nation? "Nações":
      this == blood? "Tipos Sanguineos":
      this == device? "Dispositivos":
      '';
  }
  List<String> get columns {
    return
      this == coffee? ["Nome", "Origem", "Tipo"] :
      this == beer? ["Nome", "Estilo", "IBU"]:
      this == nation? ["Nacionalidade", "Linguagem", "Capital"]:
      this == blood? ["Tipo", "Fator RH", "Grupo"]:
      this == device? ["Marca", "Modelo", "Plataforma"]:
      [] ;
  } 

  List<String> get properties {
    return 
      this == coffee? ["blend_name","origin","variety"] :
      this == beer? ["name","style","ibu"]:
      this == nation? ["nationality","language", "capital"]:
      this == blood? ["type","rh_factor", "group"]:
      this == device? ["manufacturer", "model", "platform"]:
      [];
  }
}


class DataService{
  final ValueNotifier<Map<String,dynamic>> tableStateNotifier = 
    ValueNotifier({
      'status':TableStatus.idle,
      'dataObjects':[],
      'itemType': ItemType.none
    }
  );

  var objetoOriginal = [];
  bool ordCres = false;
  static const maxItems = 15;
  static const minItems = 5;
  static const defautItems = 10;

  int _querySize = defautItems;

  void setQuerySize(int newSize) {
    _querySize = newSize <= 0 ? minItems: newSize >= maxItems? maxItems: newSize;
  }
  
  int get querySize => _querySize;



// Helper method to parse JSON data into List<Beer>
  List<Beer> parseBeerList(List<dynamic> jsonData) {
    return jsonData.map((json) => Beer.fromJson(json)).toList();
  }

  // Helper method to parse JSON data into List<Coffee>
  List<Coffee> parseCoffeeList(List<dynamic> jsonData) {
    return jsonData.map((json) => Coffee.fromJson(json)).toList();
  }

  // Helper method to parse JSON data into List<Nation>
  List<Nation> parseNationList(List<dynamic> jsonData) {
    return jsonData.map((json) => Nation.fromJson(json)).toList();
  }

  // Helper method to parse JSON data into List<Blood>
  List<Blood> parseBloodList(List<dynamic> jsonData) {
    return jsonData.map((json) => Blood.fromJson(json)).toList();
  }

  // Helper method to parse JSON data into List<Device>
  List<Device> parseDeviceList(List<dynamic> jsonData) {
    return jsonData.map((json) => Device.fromJson(json)).toList();
  }






  void ordenarEstadoAtual(String propriedade){
    List objetos =  tableStateNotifier.value['dataObjects'] ?? [];
    if (objetos == []) return;
    Ordenador ord = Ordenador();
    var objetosOrdenados = [];
    
    objetosOrdenados = ord.ordenargeral(objetos, DecididorJSON(propriedade,  ordCres));
    ordCres ? ordCres = false : ordCres = true;
    emitirEstadoOrdenado(objetosOrdenados, propriedade);
  }



/*
Adaptado de Dayanne Xavier, perfil github: https://github.com/DayXL
Repositório: https://github.com/DayXL/Atividades-de-POO-1
arquivo adaptado: https://github.com/DayXL/Atividades-de-POO-1/blob/main/receita9-10ab/lib/data/data_service.dart
*/

  void ordenarEstadoAtual2(String propriedade){
    List objetos =  tableStateNotifier.value['dataObjects'] ?? [];
    if (objetos == []) return;
    Ordenador ord = Ordenador();
    var objetosOrdenados = [];
    
    bool precisaTrocarAtualPeloProximo(atual, proximo) {
      final ordemCorreta = ordCres ? [atual, proximo] : [proximo, atual];
      return ordemCorreta[0][propriedade].compareTo(ordemCorreta[1][propriedade]) > 0;
    }

    objetosOrdenados = ord.ordenarItem2(objetos, precisaTrocarAtualPeloProximo);

    ordCres ? ordCres = false : ordCres = true;
    emitirEstadoOrdenado(objetosOrdenados, propriedade);
  }





  void emitirEstadoOrdenado(List objetosOrdenados, String propriedade){
    var estado = Map<String, dynamic>.from(tableStateNotifier.value);
    estado['dataObjects'] = objetosOrdenados;
    estado['sortCriteria'] = propriedade;
    estado['ascending'] = true;
    tableStateNotifier.value = estado;
  }


/*
Adaptado de Dayanne Xavier, perfil github: https://github.com/DayXL
Repositório: https://github.com/DayXL/Atividades-de-POO-1
arquivo adaptado: https://github.com/DayXL/Atividades-de-POO-1/blob/main/receita9-10ab/lib/data/data_service.dart
*/

void filtrarEstadoAtual(String filtrar) {
    List objetos = objetoOriginal;
    if (objetos.isEmpty) return;

    List objetosFiltrados = [];

    if (filtrar != '') {
      for (var objeto in objetos) {
        if (objeto.toString().toLowerCase().contains(filtrar.toLowerCase())) {
          objetosFiltrados.add(objeto);
        }
      }
    }

    else {
      objetosFiltrados = objetoOriginal;
    }
    emitirEstadoFiltrado(objetosFiltrados);
  }



  void carregar(index){
    final params = [ItemType.coffee, ItemType.beer, ItemType.nation, ItemType.blood, ItemType.device];
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


  void emitirEstadoPronto(ItemType type, var json) {
    List<dynamic> dataObjects = json;

    switch (type) {
      case ItemType.coffee:
        List<Coffee> coffeeList = parseCoffeeList(dataObjects);
        tableStateNotifier.value = {
          'itemType': type,
          'status': TableStatus.ready,
          'dataObjects': coffeeList,
          'propertyNames': type.properties,
          'columnNames': type.columns,
        };
        objetoOriginal = coffeeList;
        break;
      case ItemType.beer:
        List<Beer> beerList = parseBeerList(dataObjects);
        tableStateNotifier.value = {
          'itemType': type,
          'status': TableStatus.ready,
          'dataObjects': beerList,
          'propertyNames': type.properties,
          'columnNames': type.columns,
        };
        objetoOriginal = beerList;
        break;
      case ItemType.nation:
        List<Nation> nationList = parseNationList(dataObjects);
        tableStateNotifier.value = {
          'itemType': type,
          'status': TableStatus.ready,
          'dataObjects': nationList,
          'propertyNames': type.properties,
          'columnNames': type.columns,
        };
        objetoOriginal = nationList;
        break;
      case ItemType.blood:
        List<Blood> bloodList = parseBloodList(dataObjects);
        tableStateNotifier.value = {
          'itemType': type,
          'status': TableStatus.ready,
          'dataObjects': bloodList,
          'propertyNames': type.properties,
          'columnNames': type.columns,
        };
        objetoOriginal = bloodList;
        break;
      case ItemType.device:
        List<Device> deviceList = parseDeviceList(dataObjects);
        tableStateNotifier.value = {
          'itemType': type,
          'status': TableStatus.ready,
          'dataObjects': deviceList,
          'propertyNames': type.properties,
          'columnNames': type.columns,
        };
        objetoOriginal = deviceList;
        break;
      default:
        // Handle unsupported types or add more cases if needed
        break;
    }
  }


/*
Adaptado de Dayanne Xavier, perfil github: https://github.com/DayXL
Repositório: https://github.com/DayXL/Atividades-de-POO-1
arquivo adaptado: https://github.com/DayXL/Atividades-de-POO-1/blob/main/receita9-10ab/lib/data/data_service.dart
*/

  void emitirEstadoFiltrado(List objetosFiltrados) {
    var estado = Map<String, dynamic>.from(tableStateNotifier.value);
    estado['dataObjects'] = objetosFiltrados;
    tableStateNotifier.value = estado;
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

final dataService = DataService();


class DecididorJSON extends Decididor{
  String prop; 
  bool ordenadoCrescente;
  DecididorJSON(this.prop, [this.ordenadoCrescente = true]);

  @override
  bool precisaTrocarAtualPeloProximo(atual, proximo) {
    try{
      if (ordenadoCrescente == false) {
        return atual[prop].compareTo(proximo[prop]) > 0;
      } 
      else {
        return atual[prop].compareTo(proximo[prop]) < 0;
      }
    }
    catch (error){
      return false;
    }    
  }
}