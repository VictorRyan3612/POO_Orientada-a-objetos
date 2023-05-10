import 'package:app_notas/my_app.dart';
import 'package:flutter/material.dart';




void main() {
  MyApp app = const MyApp();

  runApp(app);
}

/*
Ao adicionar print("no build da classe X"); em cada build, é possivel ver que o flutter
constroi esses widget pela primeira vez, como os formularios e a pagina notes são
opcionais a serem executadas, então só são construidas quando necessárias

Clicando nos icones do myhomebottomappbar, apenas esse widget é refeito, os demais não.
*/