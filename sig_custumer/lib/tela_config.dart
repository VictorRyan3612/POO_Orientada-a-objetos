import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:settings_ui/settings_ui.dart';

class TelaConfigs extends HookWidget implements PreferredSizeWidget{
  final ValueNotifier<Brightness> currentBrightness;

  const TelaConfigs({required this.currentBrightness, super.key});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tela de configurações'),

      actions: [
        PopupMenuButton<Brightness>(
          icon: const Icon(Icons.more_vert),
          onSelected: (Brightness brightness) {
            currentBrightness.value = brightness;
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

      ),


      body:
        SettingsList(
          sections: [
            SettingsSection(
              title: Text('Tema'),
              tiles: [
                SettingsTile(
                  title: Text('Tema Escuro'),
                  leading: Icon(Icons.dark_mode),
                  onPressed: (BuildContext context) {
                    currentBrightness.value = Brightness.dark;
                  },
                ),
                SettingsTile(
                  title: Text('Tema Claro'),
                  leading: Icon(Icons.light_mode),
                  onPressed: (BuildContext context) {
                    currentBrightness.value = Brightness.light;
                  },
                ),
              ],
            ),
          ],
        ),
      );
  }
}