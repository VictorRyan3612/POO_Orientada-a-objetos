import 'package:flutter/material.dart';

/*
  Código pego e adaptado de Lucas 
  https://github.com/mts-lucas/POO/commit/71329d9c706b7bd6ad42869b875cbd42f1ad3c1d
  Retirei as validações para fazer aprender a fazer sozinho
*/

class Receita6 extends StatefulWidget{
  const Receita6({super.key});

  @override
  State<Receita6> createState() => Receita6States();
}



class Receita6States extends State<Receita6>{

  @override
  Widget build(BuildContext context) {
    const appTitle = 'Formulários';

    return Scaffold(
      bottomSheet: TextButton(
        child: Text('Voltar'),
        onPressed: () {
          Navigator.popUntil(context, ModalRoute.withName('/'));
        }
      ), 

      appBar: AppBar(
        title: Center(
          child: const Text(appTitle),
        ),
      ),

      body: Align(
        alignment: Alignment.center,
        child: Container(
          constraints: BoxConstraints(maxWidth: 600),
          child: MyCustomForm(),
        ),
      ),
    );
  }
}

// Create a Form widget.
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
            decoration: InputDecoration(labelText: 'Nome'),            
          ),
          TextFormField(
            decoration: InputDecoration(labelText: 'Idade'),
          ),
          DropdownButtonFormField<String>(
            decoration: InputDecoration(labelText: 'Função'),
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
                ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Processing Data')),
                  );

                // if (_formKey.currentState!.validate()) {
                //   ScaffoldMessenger.of(context).showSnackBar(
                //     const SnackBar(content: Text('Processing Data')),
                //   );
                // }
              },
              child: const Text('Submit'),
            ),
          ),
        ],
      ),
    );
  }
}