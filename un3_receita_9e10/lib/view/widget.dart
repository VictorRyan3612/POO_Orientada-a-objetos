import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import '../data/data_service.dart';
import '../view/form.dart';
import '../view/datatable.dart';


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
        colorScheme: const ColorScheme.dark(),
      ),
      
      debugShowCheckedModeBanner:false,

      home: Scaffold(
        appBar: MyAppBar(),

        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Align(
                alignment: Alignment.center,
                child: Container(
                  constraints: const BoxConstraints(maxWidth: 600),
                  child: MyCustomForm(callback: dataService.setQuerySize),
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
              
                    child: ValueListenableBuilder(
                      valueListenable: dataService.tableStateNotifier,
                      builder: (_, value, __) {
                        switch (value['status']){
              
                            case TableStatus.idle: 
                              return const Padding (
                                  padding: EdgeInsets.all(30.0),
                                  child: Text("Toque algum botão")
                                );
              
                            case TableStatus.loading:
                              return const Padding (
                                  padding: EdgeInsets.all(200.0),
                                  child: CircularProgressIndicator()
                                );
              
                            case TableStatus.ready: 
                              return Center(
                                child: DataTableWidget(
                                  objects: value["dataObjects"],
                                  propertyNames: value["propertyNames"],
                                  columnNames: value["columnNames"],
                                  sortCallback: dataService.ordenarEstadoAtual2,
                                ),
                              );
              
                            case TableStatus.error: 
                              return const Padding (
                                  padding: EdgeInsets.all(30.0),
                                  child: Text("Erro de conexão: Verifique sua conexão com a internet.")
                                );
                          }
                          return const Text("Erro desconhecido"); 
                      }
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),

        bottomNavigationBar: NewNavBar(itemSelectedCallback: dataService.carregar),
      )
    );
  }

}


class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  final callback;

  MyAppBar({super.key, callback}):
    callback = callback ?? (int){}

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
  
  // ignore: prefer_typing_uninitialized_variables
  final _itemSelectedCallback;

  const NewNavBar({super.key, itemSelectedCallback}):
    _itemSelectedCallback = itemSelectedCallback ?? (int);


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
        ),
        BottomNavigationBarItem(
          label: "Tipos Sanguineos", 
          icon: Icon(Icons.bloodtype)
        ),
        BottomNavigationBarItem(
          label: "Dispositivos", 
          icon: Icon(Icons.phone_android)
        )
      ]


    );
  }

}


