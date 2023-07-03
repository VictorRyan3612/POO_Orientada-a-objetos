import 'package:flutter/material.dart';
import '../data/data_service.dart';


class DataTableWidget extends StatelessWidget {
  
  // final List jsonObjects;
  final List<dynamic> objects;
  final List columnNames;
  final List propertyNames;

  const DataTableWidget({super.key, 
    this.objects = const [],
    this.columnNames = const [], 
    this.propertyNames= const []}
  );

  @override
  Widget build(BuildContext context) {
    return DataTable(
      columns: columnNames.map( 
        (name) => DataColumn(
          onSort: (columnIndex, ascending) => 
            dataService.ordenarEstadoAtual(propertyNames[columnIndex]
          ),
          label: Expanded(
            child: Text(name, style: const TextStyle(fontWeight: FontWeight.bold))
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
