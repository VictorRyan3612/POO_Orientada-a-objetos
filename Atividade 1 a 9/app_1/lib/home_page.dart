import 'package:flutter/material.dart';



class HomePage extends StatefulWidget{
  @override
  State<HomePage> createState() => HomePageStates();
}



class HomePageStates extends State<HomePage>{
  int count = 0;
  Color _currentTextColor = Color.fromARGB(255, 16, 106, 180);


  @override
  Widget build(BuildContext context) {
    return
    Scaffold(
      appBar: AppBar(
        title: 
          Center(child: 
            const Text("Lista de coisas para fazer",
            style: TextStyle(fontSize: 25)
            )
          )
        ),
 


      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(
              "https://cf.shopee.com.br/file/d2343b578c8d343870438a4046bc9091",
            ),
            fit: BoxFit.cover,
          ),
        ),
      
        
       child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Expanded(
              child: Align(
                alignment: Alignment.topCenter,
                child: Column(
                  
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Estilzar o texto",
                    style: TextStyle(fontWeight: FontWeight.bold, color: _currentTextColor)
                    ),

                    Text("Mudar a cor",
                    style: TextStyle(color: _currentTextColor)
                    ),
                    Text("Aumentar a fonte",
                    style: TextStyle(fontSize: 50, color: _currentTextColor)
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),

      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed:(){
          count ++;
        },
       ),



      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: (){},
          ),

          IconButton(
            icon: Icon(Icons.home),
            onPressed: (){},
            ),

          IconButton(
            icon: Icon(Icons.arrow_forward),
            onPressed: (){},
            ),
          ]
        )
      
      )


    );
  }

}