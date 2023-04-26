import 'package:flutter/material.dart';
import 'package:app_notas/home_page.dart';




class MyApp extends StatelessWidget{
  MyApp();
  
  @override
  Widget build(BuildContext context){
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