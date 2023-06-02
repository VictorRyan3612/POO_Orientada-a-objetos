import 'package:flutter/material.dart';
import 'package:sig_custumer/tela_menu.dart';
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
        '/': (context) => const TelaMenu(),
        '/primeira': (context) => const ModuloUsuario(),
        '/segunda': (context) => const ModuloRedes()
      },
    );
  }
}
