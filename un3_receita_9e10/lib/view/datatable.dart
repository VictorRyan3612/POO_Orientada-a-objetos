import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';


void _empty(String,bool){}


/*
Adaptado de Dayanne Xavier, perfil github: https://github.com/DayXL
Repositório: https://github.com/DayXL/Atividades-de-POO-1
arquivo adaptado: https://github.com/DayXL/Atividades-de-POO-1/blob/main/receita9-10ab/lib/view/widgets.dart
*/

class DataTableWidget extends HookWidget {
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
    final sortAscending = useState(true);
    final sortColumnIndex = useState(0);
    return DataTable(
      sortAscending: sortAscending.value,
      sortColumnIndex: sortColumnIndex.value,
      columns: columnNames.map( 
        (name) => DataColumn(
          onSort: (columnIndex, ascending) {
            sortColumnIndex.value = columnIndex;
            sortAscending.value = !sortAscending.value;

            _sortCallback(propertyNames[columnIndex]);
          },
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
              (propName) => DataCell(Text(propName))
            ).toList()
          )
        ).toList()
    );
  }
}
