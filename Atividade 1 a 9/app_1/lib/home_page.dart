import 'package:flutter/material.dart';



class HomePage extends StatefulWidget{
  @override
  State<HomePage> createState() => HomePageStates();
}



class HomePageStates extends State<HomePage>{
  @override
  Widget build(BuildContext context) {
    return
    Scaffold(
      appBar: AppBar(title: const Text("Lista de coisas para fazer")),

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

      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            label: 'Voltar',
            icon: Icon(Icons.arrow_back),
          ),

          BottomNavigationBarItem(
            label: "Inicio", 
            icon: Icon(Icons.home)),

          BottomNavigationBarItem(
            label: "Avançar", 
            icon: Icon(Icons.arrow_forward)),
        ]
      
      )


    );
  }

}