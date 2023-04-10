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
  int count = 0;
  final Color _currentTextColor = Color.fromARGB(255, 16, 106, 180);


  @override
  Widget build(BuildContext context) {
    return
    Scaffold(
      appBar: AppBar(
        title: const
          Center(child: 
            Text("Lista de coisas para fazer",
            style: TextStyle(fontSize: 25)
            )
          )
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


      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(
              "https://cf.shopee.com.br/file/d2343b578c8d343870438a4046bc9091",
            ),
            fit: BoxFit.cover,
          ),
        ),
      
        
       child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Expanded(
              child: Align(
                alignment: Alignment.topCenter,
                child: Column(
                  
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Estilzar o texto",
                    style: TextStyle(fontWeight: FontWeight.bold, color: _currentTextColor)
                    ),

                    Text("Mudar a cor",
                    style: TextStyle(color: _currentTextColor)
                    ),
                    Text("Aumentar a fonte",
                    style: TextStyle(fontSize: 50, color: _currentTextColor)
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),

      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed:(){
          _notepage(context);
        },
        tooltip: "Novo",
       ),



      bottomNavigationBar: MyAppBar()



    );
  }

}

class MyAppBar extends StatelessWidget{
  MyAppBar();

  @override
  Widget build(BuildContext context){
  
      return BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            label: "Voltar",
            icon: Icon(Icons.arrow_back),
          ),

          BottomNavigationBarItem(
            label: "Tela inicial", 
            icon: Icon(Icons.home)
            ),

          BottomNavigationBarItem(
            label: "Avançar", 
            icon: Icon(Icons.arrow_forward)
          )

        ]
      );

    }
  }
