import 'package:flutter/material.dart';

final dataService = DataService();
class DataService{

  
  final ValueNotifier<List> tableStateNotifier = new ValueNotifier([]); 


  void carregar(index){
    if (index == 1) carregarCervejas();

  }

  void carregarCervejas(){
  tableStateNotifier.value = [
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
  ];
  }
}


// var dataObjects = [
//   {"name": "La Fin Du Monde", "style": "Bock", "ibu": "65"},
//   {"name": "Sapporo Premiume", "style": "Sour Ale", "ibu": "54"},
//   {"name": "Duvel", "style": "Pilsner", "ibu": "82"},
//   {"name": "La Fin Du Monde", "style": "Bock", "ibu": "65"},
//   {"name": "Sapporo Premiume", "style": "Sour Ale", "ibu": "54"},
//   {"name": "Duvel", "style": "Pilsner", "ibu": "82"},
//   {"name": "La Fin Du Monde", "style": "Bock", "ibu": "65"},
//   {"name": "Sapporo Premiume", "style": "Sour Ale", "ibu": "54"},
//   {"name": "Duvel", "style": "Pilsner", "ibu": "82"},
//   {"name": "La Fin Du Monde", "style": "Bock", "ibu": "65"},
//   {"name": "Sapporo Premiume", "style": "Sour Ale", "ibu": "54"},
//   {"name": "Duvel", "style": "Pilsner", "ibu": "82"},
// ];

const iconesnomesVar = [
  "Voltar",
  "Inical",
  "Avançar",
];


var dataListaNotas = [

    {
      "name": "Salvar as notas em arquivos ou banco de dados",
      "importancy": "vital",
      "difficulty": "media"
    },

    {
      "name": "Fazer Calendário",
      "importancy": "desejável",
      "difficulty": "alta"
    },

    {
      "name": "Mudar tema", 
      "importancy": "opcional", 
      "difficulty": "baixa"
    },
    {
      "name": "Fazer Calendário",
      "importancy": "desejável",
      "difficulty": "alta"
    },
    {
      "name": "Fazer Calendário",
      "importancy": "desejável",
      "difficulty": "alta"
    },
    {
      "name": "Fazer Calendário",
      "importancy": "desejável",
      "difficulty": "alta"
    },
    {
      "name": "Fazer Calendário",
      "importancy": "desejável",
      "difficulty": "alta"
    },
    {
      "name": "Fazer Calendário",
      "importancy": "desejável",
      "difficulty": "alta"
    },
    {
      "name": "Fazer Calendário",
      "importancy": "desejável",
      "difficulty": "alta"
    },
    {
      "name": "Fazer Calendário",
      "importancy": "desejável",
      "difficulty": "alta"
    },
    {
      "name": "Fazer Calendário",
      "importancy": "desejável",
      "difficulty": "alta"
    },
    {
      "name": "Fazer Calendário",
      "importancy": "desejável",
      "difficulty": "alta"
    },
    {
      "name": "Fazer Calendário",
      "importancy": "desejável",
      "difficulty": "alta"
    },
    {
      "name": "Fazer Calendário",
      "importancy": "desejável",
      "difficulty": "alta"
    },
    {
      "name": "Fazer Calendário",
      "importancy": "desejável",
      "difficulty": "alta"
    },
    {
      "name": "Fazer Calendário",
      "importancy": "desejável",
      "difficulty": "alta"
    },
    {
      "name": "Fazer Calendário",
      "importancy": "desejável",
      "difficulty": "alta"
    },
  ];

var listaPhoneListview = [
  {
    "nome": "Nome 1",
    "telefone": "telefone 1",
  },
    {
    "nome": "Nome 2",
    "telefone": "telefone 2",
  },
    {
    "nome": "Nome 3",
    "telefone": "telefone 3",
  },
];
