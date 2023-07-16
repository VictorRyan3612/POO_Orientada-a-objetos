import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import '../data/data_service.dart';
import '../data/data_service2.dart';





@immutable
class MyCustomForm extends HookWidget {
  final dynamic callback; 


  const MyCustomForm({super.key, this.callback});
  



  @override
  Widget build(BuildContext context) {
    var state = useState(DataService2.defautItems);
    return Form(
      child: Column(
        children: [
          DropdownButtonFormField<int>(
            decoration: const InputDecoration(labelText: 'Quantidade de itens'),
            value: state.value,
            onChanged: (newValue) {
              state.value = newValue ?? DataService2.defautItems;
              callback(state.value);
            },
            
            items: const [
              DropdownMenuItem<int>(
                value: DataService2.minItems,
                child: Text('5 Itens'),
              ),
              DropdownMenuItem<int>(
                value: DataService2.defautItems,
                child: Text('10 Itens'),
              ),
              DropdownMenuItem<int>(
                value: DataService2.maxItems,
                child: Text('15 Itens'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}