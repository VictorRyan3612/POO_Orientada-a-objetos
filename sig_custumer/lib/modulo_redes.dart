import 'package:flutter/material.dart';


class ModuloRedes extends StatelessWidget {
  const ModuloRedes({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Módulo Redes sociais'),
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