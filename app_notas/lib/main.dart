import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final _currentBrightness = useState(Brightness.dark);

    return MaterialApp(
      title: 'Mudança de Tema',
      theme: ThemeData(
        brightness: _currentBrightness.value,
        primarySwatch: Colors.blue,
      ),
      home: HomePageApp(_currentBrightness)
      );
    
  }
}

class HomePageApp extends StatelessWidget {
  final ValueNotifier<Brightness> _currentBrightness;

  HomePageApp(this._currentBrightness);
  void _toggleTheme() {
    _currentBrightness.value = _currentBrightness.value == Brightness.light
        ? Brightness.dark
        : Brightness.light;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: _toggleTheme,
          child: Text(
            'Alternar Tema',
            style: TextStyle(fontSize: 20),
          ),
        ),
      ),
    );
  }

}
