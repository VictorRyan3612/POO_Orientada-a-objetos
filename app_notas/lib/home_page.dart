import 'package:flutter/material.dart';
import 'package:app_notas/my_home_appbar.dart';
import 'package:app_notas/my_home_bottom_appbar.dart';
import 'package:app_notas/note_page.dart';
import 'package:app_notas/var_global.dart';
import 'package:app_notas/my_home_body.dart';
import 'package:app_notas/form_app.dart';
import 'package:flutter_hooks/flutter_hooks.dart';



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




class HomePageApp extends HookWidget{
  final ValueNotifier<Brightness> _currentBrightness;

  const HomePageApp(this._currentBrightness, {super.key});


  @override
  Widget build(BuildContext context) {
    return
    Scaffold(
      appBar:  MyHomeAppBar(_currentBrightness),


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
      ),


      
      floatingActionButton: FloatingActionButton(
        onPressed:(){
          _notepage(context);
        },
        tooltip: "Nova anotação",
        child: const Icon(Icons.add),
      ),



      bottomNavigationBar: MyHomeBottomAppBar(
        myIcones: const [
          Icons.local_drink_rounded,
          Icons.task,
          Icons.phone,
        ],
        nomesIcones: iconesnomesVar,
        itemSelectedCallback: dataService.carregar
        
      ),

      body: ValueListenableBuilder(
        valueListenable: dataService.tableStateNotifier,
        builder:(_, value, __){
          return MyListaAfazeres(
            objects: dataService.tableStateNotifier.value["objects"],
            propertyNames: dataService.tableStateNotifier.value["props"],
          );


          },

      )
    );
  }
}
