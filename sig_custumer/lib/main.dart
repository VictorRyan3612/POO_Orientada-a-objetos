import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import 'modulo_midias.dart';
import 'tela_menu.dart';
import 'modulo_usuario.dart';
import 'modulo_redes.dart';
import 'tela_config.dart';



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
      scaffoldBackgroundColor: const Color.fromARGB(255, 0, 0, 0)
    );
    final lightTheme = ThemeData(
      brightness: Brightness.light,
      primarySwatch: Colors.blue,
      scaffoldBackgroundColor: const Color.fromARGB(255, 175, 175, 175)
    );

    return MaterialApp(
      debugShowCheckedModeBanner:false,
      
      theme: currentBrightness.value == Brightness.dark ? darkTheme : lightTheme,

      
      initialRoute: '/',
      routes: {
        '/': (context) => const TelaMenu(),
        '/ModUser': (context) => const ModuloUsuario(),
        '/ModRed': (context) => const ModuloRedes(),
        '/ModMid':(context) => const ModuloMidia(),
        '/Configs':(context) => TelaConfigs(currentBrightness: currentBrightness),
      },
    );
  }
}
