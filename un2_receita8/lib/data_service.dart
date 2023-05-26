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
  final ValueNotifier<Map<String,dynamic>> tableStateNotifier= new ValueNotifier(estadoAplicativo);
  int querySize = 5;


  void carregar(index){
    final funcoes = [carregarCafes, carregarCervejas, carregarNacoes];
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


  void carregarCafes() {
    var cafesUri = Uri(
      scheme: "https",
      host: "random-data-api.com",
      path: "api/coffee/random_coffee",
      queryParameters: {'size': '$querySize'}
    );

    http.read(cafesUri).then((jsonString){
      var cafesJson = jsonDecode(jsonString);
      tableStateNotifier.value = {
        'status': TableStatus.ready,
        "objects": cafesJson,
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
    });
    
  }



  void carregarCervejas() {
    var beersUri = Uri(
      scheme: 'https',
      host: 'random-data-api.com',
      path: 'api/beer/random_beer',
      queryParameters: {'size': '$querySize'}
    );

    fetchData(beersUri);
  }

  void fetchData(Uri uri) async {
    try {
      var jsonString = await http.read(uri);
      var uriJson = jsonDecode(jsonString);
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
    
    catch (error) {
      if (error.runtimeType.toString() == '_ClientSocketException') {
        tableStateNotifier.value={
          'status':TableStatus.error
          };
        print('Erro de conexão: Verifique sua conexão com a internet.');
      } else {
        print('Erro desconhecido: $error');
      }
    }
  }



    Future<void> carregarNacoes() async{

    var nacoesUri = Uri(
      scheme: 'https',
      host: 'random-data-api.com',
      path: 'api/nation/random_nation',
      queryParameters: {'size': '$querySize'}
    );


    var jsonString = await http.read(nacoesUri);
    var nacoesJson = jsonDecode(jsonString);



    tableStateNotifier.value = {
      'status': TableStatus.ready,
      "objects": nacoesJson,
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

}