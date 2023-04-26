import 'package:flutter/material.dart';
import 'package:un1_tarefa6/form_app.dart';


class MyApp extends StatelessWidget{
  const MyApp({super.key});


 @override
  Widget build(BuildContext context){
    return MaterialApp(
      theme: ThemeData(
      fontFamily: 'Times new roman',
      primarySwatch: Colors.deepPurple,
      colorScheme: const ColorScheme.dark()
      ),


      home: const FormApp()

    );

  }

}