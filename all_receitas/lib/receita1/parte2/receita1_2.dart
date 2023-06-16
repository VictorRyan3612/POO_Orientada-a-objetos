import 'package:flutter/material.dart';

class Receita1Parte2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.deepPurple),
      home: Scaffold(
        appBar: AppBar(title: Text("Cervejas")),
        body: 
        MyStatelessWidget()
        
      )
    );
  }
}

// https://api.flutter.dev/flutter/material/DataTable-class.html
class MyStatelessWidget extends StatelessWidget {
  const MyStatelessWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: DataTable(
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
          DataRow(
            cells: <DataCell>[
              DataCell(Text('Duvel')),
              DataCell(Text('Pilsner')),
              DataCell(Text('1')),
            ],
          ),
          DataRow(
            cells: <DataCell>[
              DataCell(Text('Duvel')),
              DataCell(Text('Pilsner')),
              DataCell(Text('2')),
            ],
          ),
          DataRow(
            cells: <DataCell>[
              DataCell(Text('Duvel')),
              DataCell(Text('Pilsner')),
              DataCell(Text('3')),
            ],
          ),
          DataRow(
            cells: <DataCell>[
              DataCell(Text('Duvel')),
              DataCell(Text('Pilsner')),
              DataCell(Text('4')),
            ],
          ),
          DataRow(
            cells: <DataCell>[
              DataCell(Text('Duvel')),
              DataCell(Text('Pilsner')),
              DataCell(Text('5')),
            ],
          ),
          DataRow(
            cells: <DataCell>[
              DataCell(Text('Duvel')),
              DataCell(Text('Pilsner')),
              DataCell(Text('6')),
            ],
          ),
          DataRow(
            cells: <DataCell>[
              DataCell(Text('Duvel')),
              DataCell(Text('Pilsner')),
              DataCell(Text('7')),
            ],
          ),
          DataRow(
            cells: <DataCell>[
              DataCell(Text('Duvel')),
              DataCell(Text('Pilsner')),
              DataCell(Text('8')),
            ],
          ),
          DataRow(
            cells: <DataCell>[
              DataCell(Text('Duvel')),
              DataCell(Text('Pilsner')),
              DataCell(Text('9')),
            ],
          ),
          DataRow(
            cells: <DataCell>[
              DataCell(Text('Duvel')),
              DataCell(Text('Pilsner')),
              DataCell(Text('10')),
            ],
          ),
          DataRow(
            cells: <DataCell>[
              DataCell(Text('Duvel')),
              DataCell(Text('Pilsner')),
              DataCell(Text('11')),
            ],
          ),
          DataRow(
            cells: <DataCell>[
              DataCell(Text('Duvel')),
              DataCell(Text('Pilsner')),
              DataCell(Text('12')),
            ],
          ),

        ],
      )
    
    );
  }
  

}