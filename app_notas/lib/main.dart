import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'home_page.dart';


// Implementar dashboard ui
// tela de configurações

void main() {
  MyApp app = MyApp();
  runApp(app);
}

class MyApp extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final currentBrightness = useState(Brightness.dark);

    return MaterialApp(
      debugShowCheckedModeBanner:false,
      
      title: 'Mudança de Tema',
      theme: ThemeData(
        brightness: currentBrightness.value,
        primarySwatch: Colors.blue,
      ),
      home: HomePageApp(currentBrightness)
      );
    
  }
}
