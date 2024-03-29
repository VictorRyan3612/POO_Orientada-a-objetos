import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

enum TableStatus{idle,loading,ready,error}
var estadoAplicativo = {
  'status':TableStatus.idle,
  "objects": [],
  "props": [],
  "columnsNames": [
    "Propriedade 1", 
    "Propriedade 2", 
    "Propriedade 3"
  ]
};


class DataService{
  final ValueNotifier<Map<String,dynamic>> tableStateNotifier = ValueNotifier(estadoAplicativo);
  int querySize = 5;


  void carregar(index){
    final funcoes = [carregarCafes, carregarCervejas, carregarNacoes, carregarSangues];
    tableStateNotifier.value = {
      'status': TableStatus.loading,
      "objects": [],
      "props": [],
      "columnsNames": [
        "Propriedade 1", 
        "Propriedade 2", 
        "Propriedade 3"
      ]
    };
    funcoes[index]();
  }

  void setQuerySize(int newSize) {
    querySize = newSize;
  }


  Future<void> carregarCafes() async{
    var cafesUri = Uri(
      scheme: "https",
      host: "random-data-api.com",
      path: "api/coffee/random_coffee",
      queryParameters: {'size': '$querySize'}
    );
    fetchData(cafesUri, carregarCafes);
  }



  Future<void> carregarCervejas() async {
    var beersUri = Uri(
      scheme: 'https',
      host: 'random-data-api.com',
      path: 'api/beer/random_beer',
      queryParameters: {'size': '$querySize'}
    );

    fetchData(beersUri, carregarCervejas);
    
  }



    Future<void> carregarNacoes() async{

    var nacoesUri = Uri(
      scheme: 'https',
      host: 'random-data-api.com',
      path: 'api/nation/random_nation',
      queryParameters: {'size': '$querySize'}
    );
    fetchData(nacoesUri, carregarNacoes);
    
  }


  Future<void> carregarSangues() async{

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
      var uriJson = jsonDecode(jsonString);

      if (function == carregarCervejas){
        tableStateNotifier.value = {
          'status': TableStatus.ready,
          "objects": uriJson,
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
          'status': TableStatus.ready,
          "objects": uriJson,
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
          'status': TableStatus.ready,
          "objects": uriJson,
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
          'status': TableStatus.ready,
          "objects": uriJson,
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