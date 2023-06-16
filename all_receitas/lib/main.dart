import 'package:flutter/material.dart';
import 'menu_principal.dart';
import 'package:flutter_hooks/flutter_hooks.dart';


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
      initialRoute: '/',
      routes: {
        '/': (context) => const MenuPrincipal(),
        // '/re1_1': (context) => const Receita1Parte2(),
        // '/re1_2': (context) => const Receita1Parte2(),
        // '/re2': (context) => const Receita2(),
        // '/re3':(context) => const Receita3(),
      }
    );
  }
}
