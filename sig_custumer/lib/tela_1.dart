import 'package:flutter/material.dart';
import 'package:sig_custumer/tela_2.dart';

class FirstScreen extends StatelessWidget {
  const FirstScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('First Screen'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) {
                return SecondScreen();
              }),
            );
          },
          child: const Text('ir para tela 2'),
        ),
      ),
    );
  }
}