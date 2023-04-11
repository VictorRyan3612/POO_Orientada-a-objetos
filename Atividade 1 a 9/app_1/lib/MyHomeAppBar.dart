import 'package:flutter/material.dart';



class MyHomeAppBar extends StatelessWidget implements PreferredSizeWidget{
  MyHomeAppBar();
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
  
  @override
  Widget build(BuildContext context){
    return 
      AppBar(
        title: const
          Center(child: 
            Text("Lista de coisas para fazer",
            style: TextStyle(fontSize: 25)
            )
          )
        );
      }
    }

