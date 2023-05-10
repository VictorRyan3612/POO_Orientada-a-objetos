import 'package:flutter/material.dart';
import 'package:app_notas/my_home_appbar.dart';
import 'package:app_notas/my_home_bottom_appbar.dart';
import 'package:app_notas/note_page.dart';
import 'package:app_notas/var_global.dart';
import 'package:app_notas/my_home_body.dart';
import 'package:app_notas/form_app.dart';




void _notepage(BuildContext context) {
  Navigator.of(context).push(
    MaterialPageRoute(builder: (context) => NotePage()),
  );
}

void _formAppPage(BuildContext context) {
  Navigator.of(context).push(
    MaterialPageRoute(builder: (context) => FormApp()),
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
    print("no build da classe HomepageStates");
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


      
      floatingActionButton: FloatingActionButton(
        onPressed:(){
          _notepage(context);
        },
        tooltip: "Nova anotação",
        child: const Icon(Icons.add),
       ),



      bottomNavigationBar: MyHomeBottomAppBar(
        myIcones: [
          Icons.arrow_back,
          Icons.home,
          Icons.arrow_forward,
        ],
        nomesIcones: iconesnomesVar,
        itemSelectedCallback: carregar
        
      ),

      body: ValueListenableBuilder(
          valueListenable: tableStateNotifier,
          builder:(_, value, __){
            return MyListaAfazeres(
              objects: tableStateNotifier.value,
                    propertyNames: ["name","style","ibu"], 
              );

        // body: MyListaTelefone(
        //   objects: listaPhoneListview,
        //   propertyNames: const ["nome", "telefone"]
        // ), //

          },





    ));
  }

}
void carregarCervejas(){
  tableStateNotifier.value = [{
          "name": "La Fin Du Monde",
          "style": "Bock",
          "ibu": "65"

          },

          {

          "name": "Sapporo Premiume",

          "style": "Sour Ale",

          "ibu": "54"

          },

          {

          "name": "Duvel", 

          "style": "Pilsner", 

          "ibu": "82"

          }

        ];

}