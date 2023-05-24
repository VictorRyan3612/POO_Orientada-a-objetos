import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

/*
  Código pego e adaptado de Lucas 
  https://github.com/mts-lucas/POO/commit/71329d9c706b7bd6ad42869b875cbd42f1ad3c1d
  Retirei as validações para fazer aprender a fazer sozinho
*/



class FormApp extends HookWidget{
  const FormApp({super.key});


  @override
  Widget build(BuildContext context) {
    const appTitle = 'Formulários';

    return MaterialApp(
      theme: ThemeData(
        colorScheme: const ColorScheme.dark()
      ),
      
      title: appTitle,
      debugShowCheckedModeBanner: false,
      
      home: Scaffold(
        appBar: AppBar(
          title: const Text(appTitle),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.popUntil(context, ModalRoute.withName('/'));
              // Navigator.pop(context);
            },
          )

        ),
        body: Align(
        alignment: Alignment.center,
        child: Container(
          constraints: const BoxConstraints(maxWidth: 600),
          child: const MyCustomForm(),
        ),
      ),
      )
    );
    
  }
}


class MyCustomForm extends StatefulWidget {
  const MyCustomForm({super.key});

  @override
  MyCustomFormState createState() {
    return MyCustomFormState();
  }
}

class MyCustomFormState extends State<MyCustomForm> {

  var _opcao;
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          TextFormField(
            decoration: const InputDecoration(labelText: 'Nome'),            
          ),
          TextFormField(
            decoration: const InputDecoration(labelText: 'Idade'),
          ),
          DropdownButtonFormField<String>(
            decoration: const InputDecoration(labelText: 'Função'),
            value: _opcao,
            onChanged: (newValue) {
              setState(() {
                _opcao = newValue;
              });
            },
            items: const [
              DropdownMenuItem(
                value: 'Aluno',
                child: Text('Aluno'),
              ),
              DropdownMenuItem(
                value: 'Professor',
                child: Text('Professor'),
              ),
            ],
          ),

          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Processing Data')),
                  );
                }
              },
              child: const Text('Submit'),
            ),
          ),
        ],
      ),
    );
  }
}

