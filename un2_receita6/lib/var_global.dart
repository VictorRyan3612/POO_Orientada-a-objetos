import 'package:flutter/material.dart';

final dataService = DataService();
class DataService{

  
  final ValueNotifier<List> tableStateNotifier = new ValueNotifier([]); 

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
    tableStateNotifier.value = [
      {
        "pro1": "La Fin Du Monde", 
        "pro2": "Bock", 
        "pro3": "65"
      },
      {
        "pro1": "Sapporo Premiume", 
        "pro2": "Sour Ale", 
        "pro3": "54"
      },
      {
        "pro1": "Duvel",
        "pro2": "Pilsner",
        "pro3": "82"
      },

      {
        "pro1": "La Fin Du Monde", 
        "pro2": "Bock", 
        "pro3": "65"
      },
      {
        "pro1": "Sapporo Premiume", 
        "pro2": "Sour Ale", 
        "pro3": "54"
      },

      {
        "pro1": "Duvel",
        "pro2": "Pilsner",
        "pro3": "82"
      },    
    ];
  }
  void carregarNotas(){
    tableStateNotifier.value = [
       {
        "pro1": "Salvar as notas em arquivos ou banco de dados",
        "pro2": "vital",
        "pro3": "media"
      },
      {
        "pro1": "Fazer Calendário",
        "pro2": "desejável",
        "pro3": "alta"
      },
      {
        "pro1": "Mudar tema", 
        "pro2": "opcional", 
        "pro3": "baixa"
      },
      {
        "pro1": "Fazer Calendário",
        "pro2": "desejável",
        "pro3": "alta"
      },
      {
        "pro1": "Fazer Calendário",
        "pro2": "desejável",
        "pro3": "alta"
      },
      {
        "pro1": "Fazer Calendário",
        "pro2": "desejável",
        "pro3": "alta"
      },
      {
        "pro1": "Fazer Calendário",
        "pro2": "desejável",
        "pro3": "alta"
      },
      {
        "pro1": "Fazer Calendário",
        "pro2": "desejável",
        "pro3": "alta"
      },
      {
        "pro1": "Fazer Calendário",
        "pro2": "desejável",
        "pro3": "alta"
      },
      {
        "pro1": "Fazer Calendário",
        "pro2": "desejável",
        "pro3": "alta"
      },
      {
        "pro1": "Fazer Calendário",
        "pro2": "desejável",
        "pro3": "alta"
      },
      {
        "pro1": "Fazer Calendário",
        "pro2": "desejável",
        "pro3": "alta"
      },
      {
        "pro1": "Fazer Calendário",
        "pro2": "desejável",
        "pro3": "alta"
      },
      {
        "pro1": "Fazer Calendário",
        "pro2": "desejável",
        "pro3": "alta"
      },
      {
        "pro1": "Fazer Calendário",
        "pro2": "desejável",
        "pro3": "alta"
      },
      {
        "pro1": "Fazer Calendário",
        "pro2": "desejável",
        "pro3": "alta"
      },
      {
        "pro1": "Fazer Calendário",
        "pro2": "desejável",
        "pro3": "alta"
      },
    ];
  }
  
  void carregarTelefones(){
    tableStateNotifier.value = [
      {
        "pro1": "Nome 1",
        "pro2": "telefone 1",
      },
        {
        "pro1": "Nome 2",
        "pro2": "telefone 2",
      },
        {
        "pro1": "Nome 3",
        "pro2": "telefone 3",
      },
      
    ];
  }



}


const iconesnomesVar = [
  "Voltar",
  "Inical",
  "Avançar",
];

