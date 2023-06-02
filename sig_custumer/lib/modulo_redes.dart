import 'package:flutter/material.dart';
import 'package:sig_custumer/modulo_usuario.dart';

class ModuloRedes extends StatelessWidget {
  const ModuloRedes({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Second Screen'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text('Voltar!'),
        ),
      ),
    );
  }
}