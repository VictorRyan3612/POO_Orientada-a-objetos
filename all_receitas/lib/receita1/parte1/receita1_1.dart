import 'package:flutter/material.dart';
import 'home_page.dart';



class Receita1Parte1 extends StatelessWidget{

 @override
  Widget build(BuildContext context){
    return MaterialApp(
      theme: ThemeData(
      fontFamily: 'Times new roman',
      primarySwatch: Colors.deepPurple,
      colorScheme: const ColorScheme.dark()
      ),


      home: HomePage()

    );

  }

}