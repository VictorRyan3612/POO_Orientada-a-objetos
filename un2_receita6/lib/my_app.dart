import 'package:flutter/material.dart';
import 'package:un2_receita6/home_page.dart';




class MyApp extends StatelessWidget{
  MyApp();
  
  @override
  Widget build(BuildContext context){
    print("no build da classe MyApp");
    return MaterialApp(
      theme: ThemeData(
      fontFamily: 'Times new roman',
      primarySwatch: Colors.deepPurple,
      colorScheme: const ColorScheme.dark()
      ),


      home: const HomePage()

    );

  }

}