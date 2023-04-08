import 'package:flutter/material.dart';

void main() {
  MaterialApp app = MaterialApp(
      theme: ThemeData(primarySwatch: Colors.deepPurple,
      colorScheme: ColorScheme.dark()
      ),


      home: Scaffold(
        appBar: AppBar(title: Text("Lista de coisas para fazer")),

        body: Center(
          child: Column(children: [
              Text("Estilzar o texto",
              style: TextStyle(fontWeight: FontWeight.bold)),

              const Text("Mudar a cor",
              style: TextStyle(color: Color.fromARGB(255, 192, 0, 9))
              ),
              
              Text("Aumentar a fonte",
              style: TextStyle(fontSize: 50),
              ),

              Text("Mudar ícone do aplicativo")
            ],
          )


        ),

        bottomNavigationBar: Text("Botão 1"),

      ));
  runApp(app);
}
