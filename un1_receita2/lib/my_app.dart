import 'package:un1_receita2/home_page.dart';
import 'package:flutter/material.dart';



class MyApp extends StatelessWidget{

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