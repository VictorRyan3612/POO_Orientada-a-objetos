import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'data_service.dart';
import 'form.dart';
import 'datatable.dart';


final dataService = DataService();


void main() {
  MyApp app = const MyApp();
  runApp(app);
}



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
        appBar: AppBar( 
          title: const Text("Dicas"),
          ),

        body: Column(
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
                              propertyNames: value["props"],
                              columnNames: value["columnsNames"],
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
          ],
        ),

        
        
        bottomNavigationBar: NewNavBar(itemSelectedCallback: dataService.carregar),
      ));
  }

}





class NewNavBar extends HookWidget {
  
  final _itemSelectedCallback;

  NewNavBar({super.key, itemSelectedCallback}):
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
        )
      ]


    );
  }

}


