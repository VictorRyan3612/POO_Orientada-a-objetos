import 'package:flutter/material.dart';
import '/receita3/note_page.dart';
import '/receita3/my_home_AppBar.dart';
import '/receita3/my_home_body.dart';
import '/receita3/my_home_bottom_AppBar.dart';
import '/receita3/var_global.dart';


void _notepage(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (context) => NotePage()),
    );
  }

class Receita3 extends StatefulWidget{
  @override
  State<Receita3> createState() => Receita3States();
}



class Receita3States extends State<Receita3>{
 
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


      body: MyHomeBody(objects: dataObjects
        ),

      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed:(){
          _notepage(context);
        },
        tooltip: "Nova anotação",
       ),



      bottomNavigationBar: MyHomeBottomAppBar(
        myIcones: const [
          Icons.arrow_back,
          Icons.home,
          Icons.arrow_forward,
        ],
      )



    );
  }

}
