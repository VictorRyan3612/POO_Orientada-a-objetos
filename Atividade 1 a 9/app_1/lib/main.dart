import 'package:flutter/material.dart';

void main() {
  MaterialApp app = MaterialApp(
      theme: ThemeData(primarySwatch: Colors.deepPurple),
      home: Scaffold(
        appBar: AppBar(title: Text("Lista de coisas para fazer")),
        body: Center(

          child: Column(children: [
              Text("Estilzar o texto"),
              Text("Mudar a cor"),
              Text("Aumentar a fonte"),
              Text("Mudar ícone do aplicativo")
            ],
          )


        ),

        bottomNavigationBar: Text("Botão 1"),

      ));
  runApp(app);
}
