import 'package:flutter/material.dart';
import 'menu_principal.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'receita1/parte1/receita1_1.dart' as rec1_1;
// import 'receita1/parte2/receita1_2.dart' as rec1_2;

import 'home.dart';





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
      scaffoldBackgroundColor: const Color.fromARGB(255, 27, 27, 27)
    );
    final lightTheme = ThemeData(
      brightness: Brightness.light,
      primarySwatch: Colors.blue,
      scaffoldBackgroundColor: const Color.fromARGB(255, 175, 175, 175)
    );

    return MaterialApp(
      debugShowCheckedModeBanner:false,
      
      theme: currentBrightness.value == Brightness.dark ? darkTheme : lightTheme,
      // initialRoute: '/',
      // routes: {
      //   '/': (context) => const MenuPrincipal(),
      //   '/re1_1': (context) => rec1_1.Receita1Parte1(),
      //   '/re1_2': (context) => rec1_2.Receita1Parte2(),
      //   // '/re2': (context) => const Receita2(),
      //   // '/re3':(context) => const Receita3(),
      // }
      home: Home()
    );
  }
}
