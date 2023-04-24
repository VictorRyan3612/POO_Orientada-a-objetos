import 'package:flutter/material.dart';
import 'package:app_1/Var_globais.dart';


class MyHomeBody extends StatelessWidget{
  List<Map<String,dynamic>> objects;

  MyHomeBody( {super.key, this.objects = const [] });
/*
Deixar a tabela mais genrica? pegar 
Já usei o list view e list title na atividade 10 e 11
*/

  final Color _currentTextColor = const Color.fromARGB(255, 16, 106, 180);

  @override
  Widget build(BuildContext context){
    var columnNames = ["Fazer","Impotancia","Dificuldade"],
        propertyNames = ["name", "importancy", "difficulty"];

    return  

        SingleChildScrollView(
          child: Center(
            child: 
              DataTable(
                
                columns: columnNames.map( 
                    (name) => DataColumn(
                      label: Expanded(
                        child: Text(
                          name, style: const TextStyle(
                            fontFamily: "Times new roman",fontSize: 20,fontWeight: FontWeight.bold )
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
              ),
            
            
            
            )
        
      );
  }
}

/*
baseado no vídeo https://www.youtube.com/watch?v=N36B7FOvxkY
e no arquivo do github:
https://github.com/heliokamakawa/agenda_crud_flutter/blob/11fd0a1d1dcbb81da8cbe22a8dc11375478705b6/lib/app/view/contact_list.dart
*/


class MyTitleWidget extends StatelessWidget{
  List<Map<String,dynamic>> objects;

  MyTitleWidget( {super.key, this.objects = const [] });

      
  @override
  Widget build(BuildContext context) {
    
    return
    ListView.builder(
      itemCount: listaListview.length,
      itemBuilder: (context, i){
        var contato = listaListview[i];

        return ListTile(
          title: Text(contato["nome"]!),
          subtitle:  Text(contato["telefone"]!),
          trailing: SizedBox(
            width: 100,
            child: Row(
              children: const [
                IconButton(icon: Icon(Icons.edit),tooltip: "Editar", onPressed: null,),
                IconButton(icon: Icon(Icons.delete),tooltip: "Excluit", onPressed: null),
              ],
            ),
          ) ,
        );
      },
    );

  }
}