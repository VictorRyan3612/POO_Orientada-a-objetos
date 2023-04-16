import 'package:flutter/material.dart';


// Adaptado do chatGPT
class NewNavBar extends StatelessWidget {
  final List<IconData> myIcones;

  NewNavBar({required this.myIcones});

  void botaoTocado(int index) {
    print("Tocaram no botão $index");
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      onTap: botaoTocado,
      items: myIcones.map((icon) =>
         BottomNavigationBarItem(
          icon: Icon(icon),
          label: '', // rótulo vazio para não mostrar o texto
        )
      
      ).toList()
    );
  }
}

class MyHomeBottomAppBar extends StatelessWidget {
  MyHomeBottomAppBar();


  @override
  Widget build(BuildContext context) {
    return NewNavBar(
      myIcones: [
        Icons.arrow_back,
        Icons.home,
        Icons.arrow_forward,
      ],
    );
  }
}
