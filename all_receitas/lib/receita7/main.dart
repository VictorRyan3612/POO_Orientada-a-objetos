import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'data_service.dart';
import 'form.dart';
import 'datatable.dart';


final dataService = DataService();


class Receita7 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar( 
        title: const Text("Dicas"),
        ),

      body: Container(
        child: Column(
          children: [
            Align(
              alignment: Alignment.center,
              child: Container(
                constraints: const BoxConstraints(maxWidth: 600),
                child: MyCustomForm(callback: dataService.setQuerySize),
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                child:
                  ValueListenableBuilder(
                  valueListenable: dataService.tableStateNotifier,
                  builder: (_, value, __) {
                    return Center(
                      child: DataTableWidget(
                        objects: value["objects"],
                        propertyNames: value["props"],
                        columnNames: value["columnsNames"],
                      ),
                    );
                  },
                ),
                
              ),
            ),
          ],
        ),
      ),

      
      
      bottomNavigationBar: NewNavBar(itemSelectedCallback: dataService.carregar),
    );
  }

}





class NewNavBar extends HookWidget {
  
  final _itemSelectedCallback;

  NewNavBar({itemSelectedCallback}):
    _itemSelectedCallback = itemSelectedCallback ?? (int){}


  @override
  Widget build(BuildContext context) {
    
    var state = useState(1);

    return BottomNavigationBar(
      onTap: (index){
        state.value = index;
        _itemSelectedCallback(index);                
      }, 

      currentIndex: state.value,


      items: const [
        BottomNavigationBarItem(
          label: "Cafés",
          icon: Icon(Icons.coffee_outlined),
        ),

        BottomNavigationBarItem(
          label: "Cervejas", 
          icon: Icon(Icons.local_drink_outlined)
        ),

        BottomNavigationBarItem(
          label: "Nações", 
          icon: Icon(Icons.flag_outlined)
        )
      ]


    );
  }

}


