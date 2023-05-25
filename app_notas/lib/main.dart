import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

void main() {
  runApp(Temas());
}

class Temas extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final _currentBrightness = useState(Brightness.dark);

    void _toggleTheme() {
      _currentBrightness.value = _currentBrightness.value == Brightness.light
          ? Brightness.dark
          : Brightness.light;
    }

    return MaterialApp(
      title: 'Mudança de Tema',
      theme: ThemeData(
        brightness: _currentBrightness.value,
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
