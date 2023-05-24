import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

var estadoAplicativo = {
  "objects": [],
  "props": [],
};


class DataService{
  final ValueNotifier<Map<String,dynamic>> tableStateNotifier= new ValueNotifier(estadoAplicativo);


  void carregar(index){
    var res = null;
      print('carregar #1 - antes de carregarCervejas');
    if (index == 0) res = carregarCafes();
    if (index == 1) res = carregarCervejas();
      print('carregar #2 - carregarCervejas retornou $res');
    if (index == 2) res = carregarNacoes();

  }



  Future<void> carregarCafes() async{
    var cafesUri = Uri(
      scheme: "https",
      host: "random-data-api.com",
      path: "api/coffee/random_coffee",
      queryParameters: {'size': "5"}
    );

    var jsonString = await http.read(cafesUri);
    var cafesJson = jsonDecode(jsonString);
    
    tableStateNotifier.value = {
      "objects": cafesJson,
      "props": [
        "blend_name",
        "origin",
        "variety"
      ]
    };
  }


  


  Future<void> carregarCervejas() async{

    var beersUri = Uri(
      scheme: 'https',
      host: 'random-data-api.com',
      path: 'api/beer/random_beer',
      queryParameters: {'size': '5'}
    );

    print('carregarCervejas #1 - antes do await');
    var jsonString = await http.read(beersUri);

    print('carregarCervejas #2 - depois do await');
    var beersJson = jsonDecode(jsonString);



    tableStateNotifier.value = {
      "objects": beersJson,
      "props": [
        "name",
        "style",
        "ibu"
      ]
    };

  }
    Future<void> carregarNacoes() async{

    var nacoesUri = Uri(
      scheme: 'https',
      host: 'random-data-api.com',
      path: 'api/nation/random_nation',
      queryParameters: {'size': '5'}
    );


    var jsonString = await http.read(nacoesUri);
    var nacoesJson = jsonDecode(jsonString);



    tableStateNotifier.value = {
      "objects": nacoesJson,
      "props": [
        "nationality",
        "language",
        "capital"
      ]
    };
  }

}
final dataService = DataService();



void main() {
  MyApp app = MyApp();
  runApp(app);
}



class MyApp extends StatelessWidget {
  @override

  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.deepPurple),
      debugShowCheckedModeBanner:false,

      home: Scaffold(
        appBar: AppBar( 
          title: const Text("Dicas"),
          ),

        body: ValueListenableBuilder(
          valueListenable: dataService.tableStateNotifier,
          builder:(_, value, __){

            return DataTableWidget(
              objects: dataService.tableStateNotifier.value["objects"],
              // jsonObjects:value["objects"], 
              propertyNames: value["props"], 
              columnNames: ["Nome", "Estilo", "IBU"]
            );
          }
        ),
        bottomNavigationBar: NewNavBar(itemSelectedCallback: dataService.carregar),
      ));
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







class DataTableWidget extends StatelessWidget {
  // final List jsonObjects;
  List<dynamic> objects;
  final List<dynamic> columnNames;
  final List propertyNames;

  DataTableWidget( {this.objects = const [], this.columnNames = const [], this.propertyNames= const []});

  @override
  Widget build(BuildContext context) {
    return DataTable(
      columns: columnNames.map( 
        (name) => DataColumn(
          label: Expanded(
            child: Text(name, style: TextStyle(fontStyle: FontStyle.italic))
          )
        )
      ).toList(),


      rows: objects.map( 
        (obj) => DataRow(
            cells: propertyNames.map(
              (propName) => DataCell(Text(obj[propName]))
            ).toList()
          )
        ).toList());
  }

}