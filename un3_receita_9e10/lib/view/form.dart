import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import '../data/data_service.dart';



final dataService = DataService();


@immutable
class MyCustomForm extends HookWidget {
  dynamic callback; 


  MyCustomForm({super.key, this.callback});
  



  @override
  Widget build(BuildContext context) {
    var state = useState(DataService.defautItems);
    return Form(
      child: Column(
        children: [
          DropdownButtonFormField<int>(
            decoration: const InputDecoration(labelText: 'Quantidade de itens'),
            value: state.value,
            onChanged: (newValue) {
              state.value = newValue ?? 10;
              callback(state.value);
            },
            
            items: const [
              DropdownMenuItem<int>(
                value: DataService.minItems,
                child: Text('5 Itens'),
              ),
              DropdownMenuItem<int>(
                value: DataService.defautItems,
                child: Text('10 Itens'),
              ),
              DropdownMenuItem<int>(
                value: DataService.maxItems,
                child: Text('15 Itens'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}