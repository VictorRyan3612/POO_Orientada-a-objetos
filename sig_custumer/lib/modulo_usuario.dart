import 'package:flutter/material.dart';
import 'package:sig_custumer/modulo_redes.dart';

class ModuloUsuario extends StatelessWidget {
  const ModuloUsuario({super.key});

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
                return ModuloRedes();
              }),
            );
          },
          child: const Text('ir para tela 2'),
        ),
      ),
    );
  }
}