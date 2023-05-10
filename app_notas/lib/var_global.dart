import 'package:flutter/material.dart';

final dataService = DataService();
class DataService{

  
  final ValueNotifier<List> tableStateNotifier = new ValueNotifier([]); 


  void carregar(index){
    if (index == 0) carregarCervejas();
    if (index == 1) carregarNotas();
    if (index == 2) carregarTelefones();
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
      },    
    ];
  }
  void carregarNotas(){
    tableStateNotifier.value = [
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
  }
  
  void carregarTelefones(){
    tableStateNotifier.value = [
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
  }



}


const iconesnomesVar = [
  "Voltar",
  "Inical",
  "Avançar",
];

