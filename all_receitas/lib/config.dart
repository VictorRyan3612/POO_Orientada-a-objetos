import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

enum CustomBrightness {
  light,
  dark,
  dark2,
  option2,
  option3,
}


class TelaConfigs extends HookWidget implements PreferredSizeWidget{
  final ValueNotifier<CustomBrightness?> currentBrightness;

  const TelaConfigs({required this.currentBrightness, super.key});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tela de configurações'),
      ),


      body: SafeArea(
        child: SingleChildScrollView(
          child: Align(
            alignment: Alignment.topCenter,
            child: Container(
              constraints: const BoxConstraints(maxWidth: 600),
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: DropdownButton<CustomBrightness>(
                  value: currentBrightness.value,
                  hint: const Text('Tema'),
                  items:const <DropdownMenuItem<CustomBrightness>>[
                    DropdownMenuItem<CustomBrightness>(
                      value: CustomBrightness.light,
                      child: Text('Tema claro'),
                    ),
                    DropdownMenuItem<CustomBrightness>(
                      value: CustomBrightness.dark,
                      child: Text('Tema escuro'),
                    ),
                    DropdownMenuItem<CustomBrightness>(
                      value: CustomBrightness.dark2,
                      child: Text('Tema escuro 2'),
                    ),
                  ],
                  onChanged: (newValue) {
                    currentBrightness.value = newValue;
                  },
                )
              ),
            )
          ),
        ),
      ),
    );
  }
}