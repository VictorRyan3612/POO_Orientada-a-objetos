import 'package:app_1/MyHomeBody.dart';
import 'package:app_1/MyHomeAppBar.dart';
import 'package:app_1/MyHomeBottomAppBar.dart';
import 'package:app_1/note_page.dart';
import 'package:flutter/material.dart';



void _notepage(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (context) => NotePage()),
    );
  }

class HomePage extends StatefulWidget{
  @override
  State<HomePage> createState() => HomePageStates();
}



class HomePageStates extends State<HomePage>{

  @override
  Widget build(BuildContext context) {
    return
    Scaffold(
      appBar: MyHomeAppBar(),


      // Pego de https://docs.flutter.dev/cookbook/design/drawer
      drawer: Drawer(
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text('Drawer Header'),
            ),
            ListTile(
              title: const Text('Item 1'),
              onTap: () {
                // Update the state of the app.
                // ...
              },
            ),

            ListTile(
              title: const Text('Item 2'),
              onTap: () {
                // Update the state of the app.
                // ...
              },
            ),
          ],
        ),
      ),  // Populate the Drawer in the next step.


      body: MyHomeBody(objects: [
        "Salvar as notas em arquivos ou banco de dados",
        "Fazer Calendário",
        "Mudar tema do app"]
        ),

      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed:(){
          _notepage(context);
        },
        tooltip: "Nova anotação",
       ),



      bottomNavigationBar: MyHomeBottomAppBar(
        myIcones: [
          Icons.arrow_back,
          Icons.home,
          Icons.arrow_forward,
        ],
      )



    );
  }

}









