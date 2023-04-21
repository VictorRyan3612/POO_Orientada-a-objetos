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
    var columnNames = ["Fazer","Impotancia","Dificuldade"],
        propertyNames = ["name", "importancy", "difficulty"];

    return  
      Container(
        child: Center(
          child: 
            DataTable(
            columns: columnNames.map( 
                (name) => DataColumn(
                  label: Expanded(
                    child: Text(name, style: TextStyle(fontWeight: FontWeight.bold ))
                  )
                )
              ).toList(),


            rows: objects.map( 
              (obj) => DataRow(
                cells: propertyNames.map(
                  (propName) => DataCell(Text(obj[propName]))
                ).toList()
              )
            ).toList()


          )
        )
      );
  }
}