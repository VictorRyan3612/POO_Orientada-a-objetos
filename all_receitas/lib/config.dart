import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';


class TelaConfigs extends HookWidget implements PreferredSizeWidget{
  final ValueNotifier<Brightness?> currentBrightness;

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
                child: DropdownButton<Brightness>(
                  value: currentBrightness.value,
                  hint: const Text('Select an option'),
                  items:const <DropdownMenuItem<Brightness>>[
                    DropdownMenuItem<Brightness>(
                      value: Brightness.light,
                      child: Text('Tema claro'),
                    ),
                    DropdownMenuItem<Brightness>(
                      value: Brightness.dark,
                      child: Text('Tema escuro'),
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