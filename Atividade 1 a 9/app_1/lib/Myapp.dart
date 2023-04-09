import 'package:flutter/material.dart';
import 'package:app_1/home_page.dart';



class Myapp extends StatelessWidget{

 @override
  Widget build(BuildContext context){
    return MaterialApp(
      theme: ThemeData(
      primarySwatch: Colors.deepPurple,
      colorScheme: const ColorScheme.dark()
      ),


      home: HomePage()

    );

  }

}