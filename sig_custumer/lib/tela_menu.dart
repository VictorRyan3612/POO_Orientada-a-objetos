import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:sig_custumer/var_json.dart';


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
                    child: Wrap(
                      spacing: 20,
                      runSpacing: 20,
                      children: menuItens.map((item) {
                        return CustomCard(
                          title: item['title'],
                          rota: item['rota'],
                        );
                      }).toList(),
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



class CustomCard extends StatelessWidget {
  final String title;
  final String rota;

  const CustomCard({
    required this.title,
    required this.rota,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 160.0,
      height: 160.0,
      child: Card(
        color: const Color.fromARGB(255, 21, 21, 21),
        elevation: 2.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: 10.0,
                ),
                Text(
                  title,
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 20.0,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}



/*
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
*/