import 'package:flutter/material.dart';
import 'package:un2_receita6/var_global.dart';



// lista de afazeres
class MyListaAfazeres extends StatelessWidget{
  // final List jsonObjects;
  // List<Map<String,dynamic>> objects;
  List<dynamic> objects;
  final List propertyNames;

  MyListaAfazeres( {super.key, this.objects = const [], this.propertyNames = const [],
   });

  @override
  Widget build(BuildContext context) {
  print("no build da classe MylistaAfazeres");
    return ListView(
      children: objects.map(
        (obj) => Card(
          child: ListTile(
            
            title: Text("${obj[propertyNames[0]]}"),
            subtitle: Text("${obj[propertyNames[1]]}\n${obj[propertyNames[2]]}"),
            trailing: SizedBox(
              width: 100,
              child: Row(
                children: const [
                  IconButton(icon: Icon(Icons.edit),tooltip: "Editar", onPressed: null,),
                  IconButton(icon: Icon(Icons.delete),tooltip: "Excluir", onPressed: null),
                ],
              ),
            ) ,
          )
        )
      ).toList(),
    );
  }
    

}

// lista de telefone
class MyListaTelefone extends StatelessWidget{
  List<Map<String,dynamic>> objects;
  final List propertyNames;

  MyListaTelefone( {super.key, this.objects = const [], this.propertyNames = const []});

  @override
  Widget build(BuildContext context) {

    return ListView(
      children: objects.map(
        (obj) => ListTile(
          title: Text("${obj[propertyNames[0]]}"),
          subtitle: Text("${obj[propertyNames[1]]}"),
          trailing: SizedBox(
            width: 100,
            child: Row(
              children: const [
                IconButton(icon: Icon(Icons.edit),tooltip: "Editar", onPressed: null,),
                IconButton(icon: Icon(Icons.delete),tooltip: "Excluir", onPressed: null),
              ],
            ),
          ) ,
        )
      ).toList(),
    );
  }
    

}

