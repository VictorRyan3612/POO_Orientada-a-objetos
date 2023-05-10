import 'package:flutter/material.dart';



var estadoAplicativo = {
  "objects": [],
  "props": [],
  "colunms": []
};

final dataService = DataService();
class DataService{

  
  final ValueNotifier<Map<String,dynamic>> tableStateNotifier = ValueNotifier(estadoAplicativo); 

  void carregar(index) {
    List<Function> funcoes = [
      carregarCervejas, 
      carregarNotas, 
      carregarTelefones
    ];

    funcoes[index]();
  }


  // void carregar(index){
  //   if (index == 0) carregarCervejas();
  //   if (index == 1) carregarNotas();
  //   if (index == 2) carregarTelefones();
  // }


  void carregarCervejas(){
    tableStateNotifier.value = {
      "objects": [
      {
        "name": "La Fin Du Monde", 
        "style": "Bock", 
        "ibu": "65"
      },
      {
        "name": "Sapporo Premiume", 
        "style": "Sour Ale", 
        "ibu": "54"
      },
      {
        "name": "Duvel",
        "style": "Pilsner",
        "ibu": "82"
      },

      {
        "name": "La Fin Du Monde", 
        "style": "Bock", 
        "ibu": "65"
      },
      {
        "name": "Sapporo Premiume", 
        "style": "Sour Ale", 
        "ibu": "54"
      },

      {
        "name": "Duvel",
        "style": "Pilsner",
        "ibu": "82"
      }    
      ],

      "props": [
        "name",
        "style",
        "ibu"
      ]
    };
  }

  void carregarNotas(){
    tableStateNotifier.value = {
      "objects": [
        {
          "name": "Salvar as notas em arquivos ou banco de dados",
          "importancia": "vital",
          "dificuldade": "media"
        },
        {
          "name": "Fazer Calendário",
          "importancia": "desejável",
          "dificuldade": "alta"
        },
        {
          "name": "Mudar tema", 
          "importancia": "opcional", 
          "dificuldade": "baixa"
        },
        {
          "name": "Fazer Calendário",
          "importancia": "desejável",
          "dificuldade": "alta"
        },
        {
          "name": "Fazer Calendário",
          "importancia": "desejável",
          "dificuldade": "alta"
        },
        {
          "name": "Fazer Calendário",
          "importancia": "desejável",
          "dificuldade": "alta"
        },
        {
          "name": "Fazer Calendário",
          "importancia": "desejável",
          "dificuldade": "alta"
        },
        {
          "name": "Fazer Calendário",
          "importancia": "desejável",
          "dificuldade": "alta"
        },
        {
          "name": "Fazer Calendário",
          "importancia": "desejável",
          "dificuldade": "alta"
        },
        {
          "name": "Fazer Calendário",
          "importancia": "desejável",
          "dificuldade": "alta"
        },
        {
          "name": "Fazer Calendário",
          "importancia": "desejável",
          "dificuldade": "alta"
        },
        {
          "name": "Fazer Calendário",
          "importancia": "desejável",
          "dificuldade": "alta"
        },
        {
          "name": "Fazer Calendário",
          "importancia": "desejável",
          "dificuldade": "alta"
        },
        {
          "name": "Fazer Calendário",
          "importancia": "desejável",
          "dificuldade": "alta"
        },
        {
          "name": "Fazer Calendário",
          "importancia": "desejável",
          "dificuldade": "alta"
        },
        {
          "name": "Fazer Calendário",
          "importancia": "desejável",
          "dificuldade": "alta"
        },
        {
          "name": "Fazer Calendário",
          "importancia": "desejável",
          "dificuldade": "alta"
        },
      ],

      "props":[
        "name",
        "importancia",
        "dificuldade"
      ]
    };
  }
  
  void carregarTelefones(){
    tableStateNotifier.value = {
      "objects": [
        {
          "name": "name 1",
          "telefone": "telefone 1",
        },
          {
          "name": "name 2",
          "telefone": "telefone 2",
        },
          {
          "name": "name 3",
          "telefone": "telefone 3",
        },
      ],

      "props": [
        "name",
        "telefone",
      ]
    };
  }
}


const iconesnomesVar = [
  "Cervejas",
  "Notas",
  "Telefones",
];

