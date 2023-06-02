import 'package:flutter/material.dart';
import 'package:sig_custumer/tela_0.dart';
import 'package:sig_custumer/modulo_usuario.dart';
import 'package:sig_custumer/modulo_redes.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => const Tela0(),
        '/primeira': (context) => const FirstScreen(),
        '/segunda': (context) => const SecondScreen()
      },
    );
  }
}
