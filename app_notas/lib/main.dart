import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'home_page.dart';


void main() {
  MyApp app = MyApp();
  runApp(app);
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
