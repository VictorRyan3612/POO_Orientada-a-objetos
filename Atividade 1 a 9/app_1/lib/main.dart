import 'package:flutter/material.dart';

void main() {
  MaterialApp app = MaterialApp(
    theme: ThemeData(primarySwatch: Colors.deepPurple,
    colorScheme: const ColorScheme.dark()
    ),


    home: Scaffold(
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

      bottomNavigationBar: BottomNavigationBar(items: const [
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

    )
  );
  runApp(app);
}
