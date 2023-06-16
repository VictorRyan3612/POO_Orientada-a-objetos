import 'package:flutter/material.dart';
import 'receita1/parte2/receita1_2.dart' as rec1_2;



void _receita2page(BuildContext context) {
  Navigator.  of(context).push(
    MaterialPageRoute(builder: (context) => rec1_2.Receita1Parte2()),
  );
}

class Home extends StatelessWidget {
const Home({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context){
    return Scaffold(
      body:Center(
        child: ElevatedButton(
            onPressed: () => _receita2page(context),
            child: Text("Receita 1_2")
          ),
      )

    );
  }
}