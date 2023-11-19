import 'package:flutter/material.dart';

import 'data/data_service.dart';
import 'view/widget.dart';
import 'view/form.dart';
import 'view/datatable.dart';


class Receita9a10 extends StatelessWidget {
  const Receita9a10({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(callback: dataService.filtrarEstadoAtual),

      bottomSheet: TextButton(
        child: Text('Voltar'),
        onPressed: () {
          Navigator.popUntil(context, ModalRoute.withName('/'));
        }
      ), 
      
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Align(
              alignment: Alignment.center,
              child: Container(
                constraints: const BoxConstraints(maxWidth: 600),
                child: MyCustomForm(callback: dataService.setQuerySize),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
            
                  child: ValueListenableBuilder(
                    valueListenable: dataService.tableStateNotifier,
                    builder: (_, value, __) {
                      switch (value['status']){
            
                          case TableStatus.idle: 
                            return const Padding (
                                padding: EdgeInsets.all(30.0),
                                child: Text("Toque algum botão")
                              );
            
                          case TableStatus.loading:
                            return const Padding (
                                padding: EdgeInsets.all(200.0),
                                child: CircularProgressIndicator()
                              );
            
                          case TableStatus.ready: 
                            return Center(
                              child: DataTableWidget(
                                objects: value["dataObjects"],
                                propertyNames: value["propertyNames"],
                                columnNames: value["columnNames"],
                                sortCallback: dataService.ordenarEstadoAtual2,
                              ),
                            );
            
                          case TableStatus.error: 
                            return const Padding (
                                padding: EdgeInsets.all(30.0),
                                child: Text("Erro de conexão: Verifique sua conexão com a internet.")
                              );
                        }
                        return const Text("Erro desconhecido"); 
                    }
                  ),
                ),
              ),
            ),
          ),
        ],
      ),

      bottomNavigationBar: NewNavBar(
        itemSelectedCallback: dataService.carregar,
        myIcones: const [
          Icons.coffee_outlined,
          Icons.local_drink_outlined,
          Icons.flag_outlined,
          Icons.bloodtype,
          Icons.phone_android
        ],
        
        nomesIcones: ItemType.values.map((itemType) => itemType.tipoNomes).toList(),
      )
    );
  }

}
