import 'package:flutter/material.dart';



class MyHomeBottomAppBar extends StatelessWidget{
  MyHomeBottomAppBar();

  void botaoTocado(int index) {
    print("Tocaram no botão $index");
  }



  @override
  Widget build(BuildContext context){
  
      return BottomNavigationBar(onTap: botaoTocado,
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