import 'package:flutter/material.dart';

class DataTableWidget extends StatelessWidget {
  
  // final List jsonObjects;
  List<dynamic> objects;
  final List columnNames;
  final List propertyNames;

  DataTableWidget({
    this.objects = const [],
    this.columnNames = const [], 
    this.propertyNames= const []}
  );

  @override
  Widget build(BuildContext context) {
    return DataTable(
      columns: columnNames.map( 
        (name) => DataColumn(
          label: Expanded(
            child: Text(name, style: TextStyle(fontWeight: FontWeight.bold))
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
    );
  }
}
