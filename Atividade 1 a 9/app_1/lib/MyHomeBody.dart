import 'package:flutter/material.dart';



class MyHomeBody extends StatelessWidget{
  List<String> objects;

  MyHomeBody( {this.objects = const [] });


  final Color _currentTextColor = Color.fromARGB(255, 16, 106, 180);

  @override
  Widget build(BuildContext context){
     List<Expanded> allTheLines = [];

      for (var obj in objects){
        allTheLines.add( 
          Expanded(                
            child: Center(child: Text(obj)),
          )
        );
      } 
      return  
        Container(
        
          decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(
                "https://cf.shopee.com.br/file/d2343b578c8d343870438a4046bc9091",
              ),
              fit: BoxFit.cover,
            ),
          ),
        
        child: Column(children: allTheLines),
        );
        // Column(children: allTheLines);
    
    }
}