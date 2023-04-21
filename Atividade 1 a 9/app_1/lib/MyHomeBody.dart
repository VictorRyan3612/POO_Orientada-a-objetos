import 'package:flutter/material.dart';



class MyHomeBody extends StatelessWidget{
  List<Map<String,dynamic>> objects;

  MyHomeBody( {this.objects = const [] });

  // Expanded processarUmElemento(String obj){
  //   return Expanded(                
  //     child: Center(child: Text(obj)),
  //   );
  // }


  final Color _currentTextColor = Color.fromARGB(255, 16, 106, 180);

  @override
  Widget build(BuildContext context){
      return  
        Container(
          child: 
            DataTable(
              columns: [
                DataColumn(
                  label: Expanded(
                    child: Text("Fazer", style: TextStyle(fontStyle: FontStyle.italic)),
                )),
                DataColumn(
                  label: Expanded(
                    child: Text("Prioridade", style: TextStyle(fontStyle: FontStyle.italic)),
                )),
                DataColumn(
                  label: Expanded(
                    child: Text("Importancia", style: TextStyle(fontStyle: FontStyle.italic)),
                ))
              ],
              rows: objects.map(
                (obj) => DataRow(
                  cells:[
                    DataCell(Text(obj["Fazer"])),
                    DataCell(Text(obj["Prioridade"])),
                    DataCell(Text(obj["Importancia"]))
                  ]
                )
              ).toList()
            )
        );
    }
}