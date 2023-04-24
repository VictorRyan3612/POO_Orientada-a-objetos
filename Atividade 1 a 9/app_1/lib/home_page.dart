import 'package:app_1/my_home_appbar.dart';
import 'package:app_1/my_home_bottom_appbar.dart';
import 'package:app_1/note_page.dart';
import 'package:flutter/material.dart';
import 'package:app_1/var_globais.dart';
import 'package:app_1/my_home_body.dart';

void _notepage(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (context) => const NotePage()),
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
              child: Text('Drawer Header'),
            ),
            ListTile(
              title: const Text('Item 1'),
              onTap: () {

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


      

      // body: MyHomeBody(objects: dataObjects
      //   ),
      body: MyTitleWidget(),

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









