import 'package:flutter/material.dart';



class NotePage extends StatefulWidget{
  const NotePage({super.key});

  @override
  State<NotePage> createState() => NotePageStates();
}



class NotePageStates extends State<NotePage>{

  @override
  Widget build(BuildContext context){
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