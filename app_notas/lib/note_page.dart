import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';



class NotePage extends HookWidget{
  const NotePage({super.key});


  @override
  Widget build(BuildContext context){
    return
    Scaffold(
      appBar: AppBar(
        title: const
          Center(child: 
            Text(
              "Teste de nova Página",
              style: TextStyle(fontSize: 25)
            )
          )
        ),
      
    );
  }
}