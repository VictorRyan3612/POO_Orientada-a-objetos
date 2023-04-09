import 'package:flutter/material.dart';

void main() {
  MaterialApp app = MaterialApp(
      theme: ThemeData(primarySwatch: Colors.deepPurple),
      home: Scaffold(
        appBar: AppBar(title: Text("Cervejas")),
        body: 
        MyStatelessWidget()
        
      ));
  runApp(app);
}

// https://api.flutter.dev/flutter/material/DataTable-class.html
class MyStatelessWidget extends StatelessWidget {
  const MyStatelessWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return (
      DataTable(

      columns: const <DataColumn>[
        DataColumn(
          label: Expanded(
            child: Text(
              'Nome',
              style: TextStyle(fontStyle: FontStyle.italic),
            ),
          ),
        ),
        DataColumn(
          label: Expanded(
            child: Text(
              'Estilo',
              style: TextStyle(fontStyle: FontStyle.italic),
            ),
          ),
        ),
        DataColumn(
          label: Expanded(
            child: Text(
              'IBU',
              style: TextStyle(fontStyle: FontStyle.italic),
            ),
          ),
        ),
      ],
      rows: const <DataRow>[
        DataRow(
          cells: <DataCell>[
            DataCell(Text('La Fin Du Monde')),
            DataCell(Text('Dock')),
            DataCell(Text('65')),
          ],
        ),
        DataRow(
          cells: <DataCell>[
            DataCell(Text('Sapporo Premium')),
            DataCell(Text('Sour Ale')),
            DataCell(Text('54')),
          ],
        ),
        DataRow(
          cells: <DataCell>[
            DataCell(Text('Duvel')),
            DataCell(Text('Pilsner')),
            DataCell(Text('82')),
          ],
        ),
      ],
    )
    );
  }

}
