import 'package:flutter/material.dart';



class HomePage extends StatefulWidget{
  @override
  State<HomePage> createState() => HomePageStates();
}



class HomePageStates extends State<HomePage>{
  int count = 0;
  @override
  Widget build(BuildContext context) {
    return
    Scaffold(
      appBar: AppBar(
        title: 
          Center(child: 
            const Text("Lista de coisas para fazer",
            style: TextStyle(fontSize: 25)
            )
          )
        ),



      body: Center(
        child: Column(
          children: const [
            Text("Estilzar o texto",
            style: TextStyle(fontWeight: FontWeight.bold)),

            Text("Mudar a cor",
            style: TextStyle(color: Color.fromARGB(255, 192, 0, 9))
            ),

            Text("Aumentar a fonte",
            style: TextStyle(fontSize: 50),
            ),

            Text("Mudar ícone do aplicativo")
          ],
        )

      ),


      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed:(){
          count ++;
        },
       ),



      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: (){},
          ),

          IconButton(
            icon: Icon(Icons.home),
            onPressed: (){},
            ),

          IconButton(
            icon: Icon(Icons.arrow_forward),
            onPressed: (){},
            ),
          ]
        )
      
      )


    );
  }

}