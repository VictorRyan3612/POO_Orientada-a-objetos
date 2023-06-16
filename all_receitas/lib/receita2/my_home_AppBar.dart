import 'package:flutter/material.dart';



class MyHomeAppBar extends StatelessWidget implements PreferredSizeWidget{
  MyHomeAppBar();
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
  
  @override
  Widget build(BuildContext context){
    return 
      AppBar(
        title: Text("Lista de coisas para fazer",
                style: TextStyle(fontSize: 25)),
        // backgroundColor: Colors.redAccent,
        actions: [
    

          // adaptado de https://www.fluttercampus.com/guide/223/popup-menu-on-flutter-appbar/
          PopupMenuButton(
            icon: Icon(Icons.more_vert),
            itemBuilder: (context){
              return [
                    PopupMenuItem<int>(
                        value: 0,
                        child: Text("My Account"),
                    ),

                    PopupMenuItem<int>(
                        value: 1,
                        child: Text("Settings"),
                    ),

                    PopupMenuItem<int>(
                        value: 2,
                        child: Text("Logout"),
                    ),
                ];
            },
            
            onSelected:(value){
              if(value == 0){
                  print("My account menu is selected.");
              }else if(value == 1){
                  print("Settings menu is selected.");
              }else if(value == 2){
                  print("Logout menu is selected.");
              }
            }
          ),

        ],

      );
        
  }
}
