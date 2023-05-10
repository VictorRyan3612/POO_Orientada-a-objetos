import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';



class NotePage extends HookWidget{

  @override
  Widget build(BuildContext context){
    print("no build da classe notepage");
    return
   Scaffold(
      appBar: AppBar(
        title: const
          Center(child: 
            Text("Teste de nova Página",
                style: TextStyle(fontSize: 25)
            )
          )
        ),
      
   );
  }
}