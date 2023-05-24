import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';



class MyHomeBottomAppBar extends HookWidget {
  var itemSelectedCallback;
  
  final List<IconData> myIcones;
  final List<String> nomesIcones;


  MyHomeBottomAppBar({
    super.key, required this.myIcones, 
    required this.nomesIcones, 
    this.itemSelectedCallback}){
    itemSelectedCallback ??= (_){};
  }

  void botaoTocado(int index) {
    print("Tocaram no botão $index");
  }

  @override
  Widget build(BuildContext context) {
    var state = useState(1);

    return BottomNavigationBar(
      onTap: (index){
        state.value = index;
        itemSelectedCallback(index);
      },      

      currentIndex: state.value,

      items: myIcones.asMap().keys.map( (i) =>
        BottomNavigationBarItem(
          icon: Icon(myIcones[i]),
          label: nomesIcones[i],
          )
        ).toList()
    );
  }
}
