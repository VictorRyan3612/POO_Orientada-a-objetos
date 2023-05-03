import 'package:app_notas/var_global.dart';
import 'package:flutter/material.dart';


// Adaptado do chatGPT
class MyHomeBottomAppBar extends StatelessWidget {
  final List<IconData> myIcones;
  // final List nomesIcones;
  final List<String> nomesIcones;


  const MyHomeBottomAppBar({super.key, required this.myIcones, required this.nomesIcones});

  void botaoTocado(int index) {
    print("Tocaram no botão $index");
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      
      onTap: botaoTocado,

      items: myIcones.asMap().keys.map( (i) =>
        BottomNavigationBarItem(
          icon: Icon(myIcones[i]),
          label: nomesIcones[i],
          )
        ).toList()

      // items: List.generate(myIcones.length, (index)=>index).map( (i) =>
      //   BottomNavigationBarItem(
      //     icon: Icon(myIcones[i]),
      //     label: nomesIcones[i],
      //     )
      //   ).toList()


      // items: [
      //   for(var i=0; i< myIcones.length; i++)BottomNavigationBarItem(
      //     icon: Icon(myIcones[i]),
      //     label: nomesIcones[i]
      //      // rótulo vazio para não mostrar o texto
      //   )
      // ],


    );
  }
}
