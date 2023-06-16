import 'package:flutter/material.dart';
import '/receita2/note_page.dart';
import '/receita2/my_home_AppBar.dart';
import '/receita2/my_home_body.dart';
import '/receita2/my_home_bottom_AppBar.dart';



void _notepage(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (context) => NotePage()),
    );
  }

class Receita2 extends StatefulWidget{
  @override
  State<Receita2> createState() => Receita2States();
}



class Receita2States extends State<Receita2>{

  @override
  Widget build(BuildContext context) {
    return
    Scaffold(
      appBar: MyHomeAppBar(),

      bottomSheet: TextButton(
        child: Text('Voltar'),
        onPressed: () {
          Navigator.popUntil(context, ModalRoute.withName('/'));
        }
      ), 

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


      body: MyHomeBody(),

      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed:(){
          _notepage(context);
        },
        tooltip: "Nova anotação",
       ),



      bottomNavigationBar: MyHomeBottomAppBar()



    );
  }

}








