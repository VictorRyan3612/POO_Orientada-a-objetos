import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';



enum TableStatus{idle,loading,ready,error}
enum ItemType{coffee, beer, nation, blood, none}


var estadoAplicativo = {
  'status':TableStatus.idle,
  "dataObjects": [],
  "props": [],
  "columnsNames": [
    "Propriedade 1", 
    "Propriedade 2", 
    "Propriedade 3"
  ],
  'itemType': ItemType.none
};


class DataService{
  final ValueNotifier<Map<String,dynamic>> tableStateNotifier = ValueNotifier(estadoAplicativo);
  int querySize = 5;


  void carregar(index){
    final funcoes = [carregarCafes, carregarCervejas, carregarNacoes, carregarSangues];
    tableStateNotifier.value = {
      'status': TableStatus.idle,
      "dataObjects": [],
      "props": [],
      "columnsNames": [
        "Propriedade 1", 
        "Propriedade 2", 
        "Propriedade 3"
      ], 
      'itemType': ItemType.none
    };
    funcoes[index]();
  }

  void setQuerySize(int newSize) {
    querySize = newSize;
  }


  void carregarCafes() async{
    if (tableStateNotifier.value['status'] == TableStatus.loading) return;

    if (tableStateNotifier.value['itemType'] != ItemType.coffee){
      tableStateNotifier.value = {
        'status': TableStatus.loading,
        'dataObjects': [],
        'itemType': ItemType.coffee
      };
    }

    var cafesUri = Uri(
      scheme: "https",
      host: "random-data-api.com",
      path: "api/coffee/random_coffee",
      queryParameters: {'size': '$querySize'}
    );

    fetchData(cafesUri, carregarCafes);
  }



  void carregarCervejas() async {
    if (tableStateNotifier.value['status'] == TableStatus.loading) return;
    
    if (tableStateNotifier.value['itemType'] != ItemType.beer){
      tableStateNotifier.value = {
        'status': TableStatus.loading,
        'dataObjects': [],
        'itemType': ItemType.beer
      };
    }

    var beersUri = Uri(
      scheme: 'https',
      host: 'random-data-api.com',
      path: 'api/beer/random_beer',
      queryParameters: {'size': '$querySize'}
    );

    fetchData(beersUri, carregarCervejas);
  }


    void carregarNacoes() async{
      if (tableStateNotifier.value['status'] == TableStatus.loading) return;

      if (tableStateNotifier.value['itemType'] != ItemType.nation){
        tableStateNotifier.value = {
          'status': TableStatus.loading,
          'dataObjects': [],
          'itemType': ItemType.nation
        };
      }

      var nacoesUri = Uri(
        scheme: 'https',
        host: 'random-data-api.com',
        path: 'api/nation/random_nation',
        queryParameters: {'size': '$querySize'}
      );

      fetchData(nacoesUri, carregarNacoes);
    }


  void carregarSangues() async{
    if (tableStateNotifier.value['status'] == TableStatus.loading) return;

    if (tableStateNotifier.value['itemType'] != ItemType.blood){
      tableStateNotifier.value = {
        'status': TableStatus.loading,
        'dataObjects': [],
        'itemType': ItemType.blood
      };
    }

    var sanguesUri = Uri(
      scheme: 'https',
      host: 'random-data-api.com',
      path: 'api/v2/blood_types',
      queryParameters: {'size': '$querySize'}
    );

    fetchData(sanguesUri, carregarSangues);
  }


  void fetchData(Uri uri, Function function) async {
    try {
      var jsonString = await http.read(uri);
      var listJson = jsonDecode(jsonString);

      if (tableStateNotifier.value['status'] != TableStatus.loading)
        listJson = [...tableStateNotifier.value['dataObjects'], ...listJson];  
      

      if (function == carregarCervejas){
        tableStateNotifier.value = {
        'itemType': ItemType.beer,
        'status': TableStatus.ready,
          "dataObjects": listJson,
          "props": [
            "name",
            "style",
            "ibu"
          ],
          "columnsNames": [
            "Nomes",
            "Estilo",
            "IBU"
          ]
        };
      }
      else if (function == carregarNacoes){
        tableStateNotifier.value = {
          'itemType': ItemType.nation,
          'status': TableStatus.ready,
          "dataObjects": listJson,
          "props": [
            "nationality",
            "language",
            "capital"
          ],
          "columnsNames": [
            "Nacionalidade",
            "Linguagem",
            "Capital"
          ]
        };
      }


      else if (function == carregarCafes){
        tableStateNotifier.value = {
          'itemType': ItemType.coffee,
          'status': TableStatus.ready,
          "dataObjects": listJson,
          "props": [
            "blend_name",
            "origin",
            "variety"
          ],
          "columnsNames": [
            "Nomes",
            "Origem",
            "Variedade"
          ]
        };
      }
      

      if (function == carregarSangues){
        tableStateNotifier.value = {
          'itemType': ItemType.blood,
          'status': TableStatus.ready,
          "dataObjects": listJson,
          "props": [
            "type",
            "rh_factor",
            "group"
          ],
          "columnsNames": [
            "Tipo",
            "Fator RH",
            "Grupo"
          ]
        };
      }
    }
    
    
    catch (error) {
      if (error.runtimeType.toString() == '_ClientSocketException') {
        tableStateNotifier.value={
          'status':TableStatus.error
        };
      }
    }
  }

}