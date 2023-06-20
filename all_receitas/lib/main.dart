import 'package:flutter/material.dart';
import 'menu_principal.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'receita1/parte1/receita1_1.dart' as rec1_1;
import 'receita1/parte2/receita1_2.dart' as rec1_2;
import '/receita2/home_page.dart' as rec2;
import '/receita3/home_page.dart' as rec3;
import '/receita4/home_page.dart' as rec4;
import '/receita6/form_app.dart' as rec6;
import '/receita7/main.dart' as rec7;
import '/receita8/main.dart' as rec8;
import 'config.dart';

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
        '/re1_1': (context) => rec1_1.Receita1Parte1(),
        '/re1_2': (context) => rec1_2.Receita1Parte2(),
        '/re2': (context) => rec2.Receita2(),
        '/re3':(context) => rec3.Receita3(),
        '/re4':(context) => rec4.Receita4(),
        '/re6':(context) => rec6.Receita6(),
        '/re7':(context) => rec7.Receita7(),
        '/re8':(context) => rec8.Receita8(),
        '/config':(context) => TelaConfigs(currentBrightness: currentBrightness),
      }
    );
  }
}
