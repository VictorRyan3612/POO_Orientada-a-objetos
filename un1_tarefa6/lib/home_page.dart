import 'package:flutter/material.dart';
import 'package:un1_tarefa6/note_page.dart';
import 'package:un1_tarefa6/my_home_AppBar.dart';
import 'package:un1_tarefa6/my_home_body.dart';
import 'package:un1_tarefa6/my_home_bottom_AppBar.dart';
import 'package:un1_tarefa6/var_global.dart';
import 'package:un1_tarefa6/form_app.dart';



void _notepage(BuildContext context) {
  Navigator.of(context).push(
    MaterialPageRoute(builder: (context) => const NotePage()),
  );
}

void _formAppPage(BuildContext context) {
  Navigator.of(context).push(
    MaterialPageRoute(builder: (context) => const FormApp()),
  );
}

class HomePage extends StatefulWidget{
  const HomePage({super.key});

  @override
  State<HomePage> createState() => HomePageStates();
}




class HomePageStates extends State<HomePage>{
 
  @override
  Widget build(BuildContext context) {
    return
    Scaffold(
      appBar: const MyHomeAppBar(),


      // Adaptado de https://docs.flutter.dev/cookbook/design/drawer
      drawer: Drawer(
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text('Aplicativos secundários(Testes)',style: TextStyle(fontSize: 21),),
            ),
            ListTile(
              title: const Text('Formulários'),
              onTap: () {
                _formAppPage(context);
              },
            ),

            ListTile(
              title: const Text('Item 2'),
              onTap: () {
                
              },
            ),
            
          ],
        ),
      ),  // Populate the Drawer in the next step.


      

      body: MyListaAfazeres(
        objects: dataListaNotas,
        propertyNames: const ["name","importancy","difficulty"]
        ),
      // body: MyListaTelefone(
      //   objects: listaPhoneListview,
      //   propertyNames: const ["nome", "telefone"]
      // ), //



      floatingActionButton: FloatingActionButton(
        onPressed:(){
          _notepage(context);
        },
        tooltip: "Nova anotação",
        child: const Icon(Icons.add),
       ),



      bottomNavigationBar: const MyHomeBottomAppBar(
        myIcones: [
          Icons.arrow_back,
          Icons.home,
          Icons.arrow_forward,
        ],
      )



    );
  }

}
