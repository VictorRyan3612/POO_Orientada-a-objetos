import 'package:flutter/material.dart';
import '/receita4/note_page.dart';
import '/receita4/my_home_AppBar.dart';
import '/receita4/my_home_body.dart';
import '/receita4/my_home_bottom_AppBar.dart';
import '/receita4/var_global.dart';




void _notepage(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (context) => const NotePage()),
    );
  }

class Receita4 extends StatefulWidget{
  const Receita4({super.key});

  @override
  State<Receita4> createState() => Receita4States();
}



class Receita4States extends State<Receita4>{
 
  @override
  Widget build(BuildContext context) {
    return
    Scaffold(
      appBar: const MyHomeAppBar(),
      
      bottomSheet: TextButton(
        child: Text('Voltar'),
        onPressed: () {
          Navigator.popUntil(context, ModalRoute.withName('/'));
        }
      ), 

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