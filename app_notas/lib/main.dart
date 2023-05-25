import 'package:flutter/material.dart';

void main() {
  // MyApp app = const MyApp();

  runApp(Temas());
}



class Temas extends StatefulWidget {
  @override
  _TemasState createState() => _TemasState();
}

class _TemasState extends State<Temas> {
  Brightness _currentBrightness = Brightness.light;

  void _toggleTheme() {
    setState(() {
      _currentBrightness = _currentBrightness == Brightness.light
          ? Brightness.dark
          : Brightness.light;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mudança de Tema',
      theme: ThemeData(
        brightness: _currentBrightness,
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Mudança de Tema'),
          
        ),
        body: Center(
          child: ElevatedButton(
            onPressed: _toggleTheme,
          child: Text(
              'Alternar Tema',
              style: TextStyle(fontSize: 20),
            ),
          ),
        ),
      ),
    );
  }
}
