import 'package:flutter/material.dart';

class MyHomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  final ValueNotifier<Brightness> _currentBrightness;

  const MyHomeAppBar(this._currentBrightness, {super.key});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);


  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text(
        "Lista de coisas para fazer",
        style: TextStyle(fontSize: 25)
      ),
        
      actions: [
        PopupMenuButton<Brightness>(
          icon: const Icon(Icons.more_vert),
          onSelected: (Brightness brightness) {
            _currentBrightness.value = brightness;
          },
          itemBuilder: (BuildContext context) => [
            const PopupMenuItem<Brightness>(
              value: Brightness.light,
              child: Text('Tema Claro'),
            ),
            const PopupMenuItem<Brightness>(
              value: Brightness.dark,
              child: Text('Tema Escuro'),
            ),
          ],
        ),
      ]
    );
  }
}
