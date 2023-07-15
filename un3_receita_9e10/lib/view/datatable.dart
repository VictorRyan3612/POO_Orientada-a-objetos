import 'package:flutter/material.dart';

void _empty(String,bool){}

class DataTableWidget extends StatelessWidget {
  final _sortCallback;
  final List objects;
  final List columnNames;
  final List propertyNames;

  const DataTableWidget({super.key, 
    this.objects = const [],
    this.columnNames = const [], 
    this.propertyNames= const [],
    sortCallback
    }):
    _sortCallback = sortCallback ?? _empty ;

  @override
  Widget build(BuildContext context) {
    return DataTable(
      columns: columnNames.map( 
        (name) => DataColumn(
          onSort: (columnIndex, ascending) =>
            _sortCallback(propertyNames[columnIndex]), 
          label: Expanded(
            child: Text(name,
              style: const TextStyle(
                fontStyle: FontStyle.italic,
                fontWeight: FontWeight.bold
              )
            )
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
