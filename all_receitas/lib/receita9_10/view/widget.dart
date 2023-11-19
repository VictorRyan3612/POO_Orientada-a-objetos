import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';



class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  final _callback;

  MyAppBar({super.key, callback}):
    _callback = callback ?? (int){}

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Row(
        children: [
          const Expanded(
            child: Text("Lista API's"),
          ),
          Flexible(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: TextField(
                onChanged: (value) => _callback(value),
                decoration: const InputDecoration(
                  hintText: 'Digite algo...',
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}




class NewNavBar extends HookWidget {
  
  final _itemSelectedCallback;
  final List<IconData> myIcones;
  final List<String> nomesIcones;


  const NewNavBar({
    super.key,
    required this.myIcones,
    required this.nomesIcones,
    itemSelectedCallback,
  }) : _itemSelectedCallback = itemSelectedCallback ?? (int);


  @override
  Widget build(BuildContext context) {
    
    var state = useState(1);

    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      onTap: (index){
        state.value = index;
        _itemSelectedCallback(index);                
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


