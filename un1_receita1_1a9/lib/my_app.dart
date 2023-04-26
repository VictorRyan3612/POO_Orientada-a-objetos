import 'package:flutter/material.dart';
import 'package:un1_receita1_1a9/home_page.dart';



class Myapp extends StatelessWidget{

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