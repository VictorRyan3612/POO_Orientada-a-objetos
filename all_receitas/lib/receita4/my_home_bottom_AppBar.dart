import 'package:flutter/material.dart';


// Adaptado do chatGPT
class MyHomeBottomAppBar extends StatelessWidget {
  final List<IconData> myIcones;

  const MyHomeBottomAppBar({super.key, required this.myIcones});

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