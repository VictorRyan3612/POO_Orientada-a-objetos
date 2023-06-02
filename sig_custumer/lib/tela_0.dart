import 'package:flutter/material.dart';

class Tela0 extends StatelessWidget {
  const Tela0({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
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
                Navigator.pushNamed(context, '/primeira');
              },
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.teal,
              ),
              child: Text('Ir para a tela 2'),
              onPressed: () {
                Navigator.pushNamed(context, '/segunda');
              },
            ),
          ],
        ),
      ),
    );
  }
}
