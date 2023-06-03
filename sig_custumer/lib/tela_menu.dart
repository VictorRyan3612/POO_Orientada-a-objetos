import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';


class TelaMenu extends StatelessWidget {
  const TelaMenu({super.key});
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tela 0'),
      ),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Center(
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.orange,
                            ),
                            child: Text('Ir para a tela 1'),
                            onPressed: () {
                              Navigator.pushNamed(context, '/ModUser');
                            },
                          ),
                        ),

                        Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.teal,
                            ),
                            child: Text('Ir para a tela 2'),
                            onPressed: () {
                              Navigator.pushNamed(context, '/ModRed');
                            },
                          ),
                        ),

                        Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.deepPurple,
                            ),
                            child: Text('Ir para a tela 3'),
                            onPressed: () {
                              Navigator.pushNamed(context, '/ModMid');
                            },
                          ),
                        ),


                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.red,
                            ),
                            child: Text('Configurações'),
                            onPressed: () {
                              Navigator.pushNamed(context, '/Configs');
                            },
                          ),
                        ),

                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}


