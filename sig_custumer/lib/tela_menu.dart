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
      body: Center(
        child: Column(
          children: <Widget>[
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.orange,
              ),
              child: Text('Ir para a tela 1'),
              onPressed: () {
                Navigator.pushNamed(context, '/ModUser');
              },
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.teal,
              ),
              child: Text('Ir para a tela 2'),
              onPressed: () {
                Navigator.pushNamed(context, '/ModRed');
              },
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.deepPurple,
              ),
              child: Text('Ir para a tela 3'),
              onPressed: () {
                Navigator.pushNamed(context, '/ModMid');
              },
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Color.fromARGB(255, 202, 16, 16),
              ),
              child: Text('Configurações'),
              onPressed: () {
                Navigator.pushNamed(context, '/Configs');
              },
            ),
          ],
        ),
      ),
    );
  }
}
