import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../util/ordenador.dart';



enum TableStatus{idle,loading,ready,error}

enum ItemType{
  beer, coffee, nation, blood, none;
  String get asString => '$name';

  List<String> get columns {
    return
      this == coffee? ["Nome", "Origem", "Tipo"] :
      this == beer? ["Nome", "Estilo", "IBU"]:
      this == nation? ["Nacionalidade", "Linguagem", "Capital"]:
      this == blood? ["Tipo", "Fator RH", "Grupo"]:
      [] ;
  } 

  List<String> get properties {
    return 
      this == coffee? ["blend_name","origin","variety"] :
      this == beer? ["name","style","ibu"]:
      this == nation? ["nationality","language", "capital"]:
      this == blood? ["type","rh_factor", "group"]:
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


  static const maxItems = 15;
  static const minItems = 5;
  static const defautItems = 10;

  int _querySize = defautItems;

  void setQuerySize(int newSize) {
    _querySize = newSize <= 0 ? minItems: newSize >= maxItems? maxItems: newSize;
  }
  
  int get querySize => _querySize;


  void ordenarEstadoAtual(String propriedade){
    List objetos =  tableStateNotifier.value['dataObjects'] ?? [];
    if (objetos == []) return;
    var objetosOrdenados = [];
    final type = tableStateNotifier.value['itemType'];

    if (type == ItemType.beer){
      if (propriedade == "name"){
        objetosOrdenados = ordenarFuderoso(objetos, DecididorCervejaNomeCrescente());
      }
      else if (propriedade == "style"){
        objetosOrdenados = ordenarFuderoso(objetos, DecididorCervejaEstiloCrescente());
      }
      else if (propriedade == "ibu"){
        objetosOrdenados = ordenarFuderoso(objetos, DecididorCervejaIbuCrescente());
      }
    }
    else if (type == ItemType.coffee){
      if (propriedade == "blend_name"){
        objetosOrdenados = ordenarFuderoso(objetos, DecididorCafeNameCrescente());
      }
      else if (propriedade == "origin"){
        objetosOrdenados = ordenarFuderoso(objetos, DecididorCafeOrigemCrescente());
      }
      else if (propriedade == "variety"){
        objetosOrdenados = ordenarFuderoso(objetos, DecididorCafeVariedadeCrescente());
      }
    }

    
    else if (type == ItemType.nation){
      if (propriedade == "nationality"){
        objetosOrdenados = ordenarFuderoso(objetos, DecididorNacoesNacionalidadeCrescente());
      }
      else if (propriedade == "language"){
        objetosOrdenados = ordenarFuderoso(objetos, DecididorNacoesLanguageCrescente());
      }
      else if (propriedade == "capital"){
        objetosOrdenados = ordenarFuderoso(objetos, DecididorNacoesCapitalCrescente());
      }
    }
    else if (type == ItemType.blood) {
      if (propriedade == "type"){
        objetosOrdenados = ordenarFuderoso(objetos, DecididorSangueTipoCrescente());
      }
      else if (propriedade == "rh_factor"){
        objetosOrdenados = ordenarFuderoso(objetos, DecididorSangueRhCrescente());
      }
      else if (propriedade == "group"){
        objetosOrdenados = ordenarFuderoso(objetos, DecididorSangueGrupoCrescente());
      }
    }
    
    emitirEstadoOrdenado(objetosOrdenados, propriedade);
  }



  void emitirEstadoOrdenado(List objetosOrdenados, String propriedade){
    Map<String,dynamic> estado = {...tableStateNotifier.value};
    estado['dataObjects'] = objetosOrdenados;
    estado['sortCriteria'] = propriedade;
    estado['ascending'] = true;
    tableStateNotifier.value = estado;
  }


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

final dataService = DataService();


class DecididorCervejaNomeCrescente extends Decididor{
  @override
  bool precisaTrocarAtualPeloProximo(atual, proximo) {
    try{
      return atual["name"].compareTo(proximo["name"]) > 0;
    }
    catch (error){
      return false;
    }    
  }
}

class DecididorCervejaNomeDecrescente extends Decididor{
  @override
  bool precisaTrocarAtualPeloProximo(atual, proximo) {
    try{
      return atual["name"].compareTo(proximo["name"]) < 0;
    }
    catch (error){
      return false;
    }    
  }

}

class DecididorCervejaEstiloCrescente extends Decididor{
  @override
  bool precisaTrocarAtualPeloProximo(atual, proximo) {
    try{
      return atual["style"].compareTo(proximo["style"]) > 0;
    }
    catch (error){
      return false;
    }    
  }

}



class DecididorCervejaEstiloDecrescente extends Decididor{
  @override
  bool precisaTrocarAtualPeloProximo(atual, proximo) {
    try{
      return atual["style"].compareTo(proximo["style"]) < 0;
    }
    catch (error){
      return false;
    }
  }

}

class DecididorCervejaIbuCrescente extends Decididor{
  @override
  bool precisaTrocarAtualPeloProximo(atual, proximo) {
    try{
      return atual["ibu"].compareTo(proximo["ibu"]) > 0;
    }
    catch (error){
      return false;
    }    
  }

}
class DecididorCervejaIbuDecrescente extends Decididor{
  @override
  bool precisaTrocarAtualPeloProximo(atual, proximo) {
    try{
      return atual["ibu"].compareTo(proximo["ibu"]) < 0;
    }
    catch (error){
      return false;
    }    
  }

}



class DecididorCafeNameCrescente extends Decididor{
  @override
  bool precisaTrocarAtualPeloProximo(atual, proximo) {
    try{
      return atual["blend_name"].compareTo(proximo["blend_name"]) > 0;
    }
    catch (error){
      return false;
    }    
  }

}
class DecididorCafeNameDecrescente extends Decididor{
  @override
  bool precisaTrocarAtualPeloProximo(atual, proximo) {
    try{
      return atual["blend_name"].compareTo(proximo["blend_name"]) < 0;
    }
    catch (error){
      return false;
    }    
  }

}


class DecididorCafeOrigemCrescente extends Decididor{
  @override
  bool precisaTrocarAtualPeloProximo(atual, proximo) {
    try{
      return atual["origin"].compareTo(proximo["origin"]) > 0;
    }
    catch (error){
      return false;
    }    
  }

}
class DecididorCafeOrigemDecrescente extends Decididor{
  @override
  bool precisaTrocarAtualPeloProximo(atual, proximo) {
    try{
      return atual["origin"].compareTo(proximo["origin"]) < 0;
    }
    catch (error){
      return false;
    }    
  }

}

class DecididorCafeVariedadeCrescente extends Decididor{
  @override
  bool precisaTrocarAtualPeloProximo(atual, proximo) {
    try{
      return atual["variety"].compareTo(proximo["variety"]) > 0;
    }
    catch (error){
      return false;
    }    
  }

}
class DecididorCafeVariedadeDecrescente extends Decididor{
  @override
  bool precisaTrocarAtualPeloProximo(atual, proximo) {
    try{
      return atual["variety"].compareTo(proximo["variety"]) < 0;
    }
    catch (error){
      return false;
    }    
  }

}



class DecididorNacoesNacionalidadeCrescente extends Decididor{
  @override
  bool precisaTrocarAtualPeloProximo(atual, proximo) {
    try{
      return atual["nationality"].compareTo(proximo["nationality"]) > 0;
    }
    catch (error){
      return false;
    }    
  }

}
class DecididorNacoesNacionalidadeDecrescente extends Decididor{
  @override
  bool precisaTrocarAtualPeloProximo(atual, proximo) {
    try{
      return atual["nationality"].compareTo(proximo["nationality"]) < 0;
    }
    catch (error){
      return false;
    }    
  }

}


class DecididorNacoesLanguageCrescente extends Decididor{
  @override
  bool precisaTrocarAtualPeloProximo(atual, proximo) {
    try{
      return atual["language"].compareTo(proximo["language"]) > 0;
    }
    catch (error){
      return false;
    }    
  }

}
class DecididorNacoesLanguageDecrescente extends Decididor{
  @override
  bool precisaTrocarAtualPeloProximo(atual, proximo) {
    try{
      return atual["language"].compareTo(proximo["language"]) < 0;
    }
    catch (error){
      return false;
    }    
  }

}

class DecididorNacoesCapitalCrescente extends Decididor{
  @override
  bool precisaTrocarAtualPeloProximo(atual, proximo) {
    try{
      return atual["capital"].compareTo(proximo["capital"]) > 0;
    }
    catch (error){
      return false;
    }    
  }

}
class DecididorNacoesCapitalDecrescente extends Decididor{
  @override
  bool precisaTrocarAtualPeloProximo(atual, proximo) {
    try{
      return atual["capital"].compareTo(proximo["capital"]) < 0;
    }
    catch (error){
      return false;
    }    
  }

}



class DecididorSangueTipoCrescente extends Decididor{
  @override
  bool precisaTrocarAtualPeloProximo(atual, proximo) {
    try{
      return atual["type"].compareTo(proximo["type"]) > 0;
    }
    catch (error){
      return false;
    }    
  }

}
class DecididorSangueTipoDecrescente extends Decididor{
  @override
  bool precisaTrocarAtualPeloProximo(atual, proximo) {
    try{
      return atual["type"].compareTo(proximo["type"]) < 0;
    }
    catch (error){
      return false;
    }    
  }

}


class DecididorSangueRhCrescente extends Decididor{
  @override
  bool precisaTrocarAtualPeloProximo(atual, proximo) {
    try{
      return atual["rh_factor"].compareTo(proximo["rh_factor"]) > 0;
    }
    catch (error){
      return false;
    }    
  }

}
class DecididorSangueRhDecrescente extends Decididor{
  @override
  bool precisaTrocarAtualPeloProximo(atual, proximo) {
    try{
      return atual["rh_factor"].compareTo(proximo["rh_factor"]) < 0;
    }
    catch (error){
      return false;
    }    
  }

}

class DecididorSangueGrupoCrescente extends Decididor{
  @override
  bool precisaTrocarAtualPeloProximo(atual, proximo) {
    try{
      return atual["group"].compareTo(proximo["group"]) > 0;
    }
    catch (error){
      return false;
    }    
  }

}
class DecididorSangueGrupoDecrescente extends Decididor{
  @override
  bool precisaTrocarAtualPeloProximo(atual, proximo) {
    try{
      return atual["group"].compareTo(proximo["group"]) < 0;
    }
    catch (error){
      return false;
    }    
  }

}
