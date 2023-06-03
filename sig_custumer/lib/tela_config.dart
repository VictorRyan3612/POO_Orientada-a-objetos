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

      ),


      body:
        SettingsList(
          sections: [
            SettingsSection(
              tiles: [
                SettingsTile(
                  title: const Text('Alternar tema'),
                  leading: const Icon(Icons.dark_mode),
                  onPressed: (BuildContext context) {
                    if (currentBrightness.value == Brightness.dark){
                      currentBrightness.value = Brightness.light;
                    }
                    else{
                      currentBrightness.value = Brightness.dark;
                    }
                  },
                ),
              ],
            ),
          ],
        ),
      );
  }
}