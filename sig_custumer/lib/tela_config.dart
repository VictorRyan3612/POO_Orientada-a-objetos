import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';


class TelaConfigs extends HookWidget {
  final ValueNotifier<Brightness>? currentBrightness;

  const TelaConfigs({required this.currentBrightness, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tela de configurações'),
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