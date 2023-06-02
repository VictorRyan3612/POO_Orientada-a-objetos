import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import 'package:sig_custumer/modulo_midias.dart';
import 'package:sig_custumer/tela_menu.dart';
import 'package:sig_custumer/modulo_usuario.dart';
import 'package:sig_custumer/modulo_redes.dart';


void main() {
  runApp(const MainApp());
}

class MainApp extends HookWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => const TelaMenu(),
        '/ModUser': (context) => const ModuloUsuario(),
        '/ModRed': (context) => const ModuloRedes(),
        '/ModMid':(context) => const ModuloMidia()
      },
    );
  }
}
