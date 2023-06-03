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
    final currentBrightness = useState(Brightness.dark);
    
    final darkTheme = ThemeData(
      brightness: Brightness.dark,
      scaffoldBackgroundColor: Color.fromARGB(255, 0, 0, 0)
    );
    final lightTheme = ThemeData(
      brightness: Brightness.light,
      primarySwatch: Colors.blue,
      scaffoldBackgroundColor: Color.fromARGB(255, 175, 175, 175)
    );

    return MaterialApp(
      debugShowCheckedModeBanner:false,
      
      theme: currentBrightness.value == Brightness.dark ? darkTheme : lightTheme,

      
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
