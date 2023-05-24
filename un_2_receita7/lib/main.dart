import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

var estadoAplicativo = {
  "objects": [],
  "props": [],
  "columnsNames": [
    "Propriedade 1", 
    "Propriedade 2", 
    "Propriedade 3"
  ]
};


class DataService{
  final ValueNotifier<Map<String,dynamic>> tableStateNotifier= new ValueNotifier(estadoAplicativo);
  int querySize = 5;


  void carregar(index){
    var res = null;
    print('carregar #1 - antes de carregarCervejas');
    if (index == 0) res = carregarCafes();
    if (index == 1) res = carregarCervejas();
    print('carregar #2 - carregarCervejas retornou $res');
    if (index == 2) res = carregarNacoes();

  }

  void setQuerySize(int newSize) {
    querySize = newSize = 5;
  }


  Future<void> carregarCafes() async{
    var cafesUri = Uri(
      scheme: "https",
      host: "random-data-api.com",
      path: "api/coffee/random_coffee",
      queryParameters: {'size': '$querySize'}
    );

    var jsonString = await http.read(cafesUri);
    var cafesJson = jsonDecode(jsonString);
    
    tableStateNotifier.value = {
      "objects": cafesJson,
      "props": [
        "blend_name",
        "origin",
        "variety"
      ],
      "columnsNames": [
        "Nomes",
        "Origem",
        "Variedade"
      ]
    };
  }


  


  Future<void> carregarCervejas() async{

    var beersUri = Uri(
      scheme: 'https',
      host: 'random-data-api.com',
      path: 'api/beer/random_beer',
      queryParameters: {'size': '$querySize'}
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
      ],
      "columnsNames": [
        "Nomes",
        "Estilo",
        "IBU"
      ]
    };

  }
    Future<void> carregarNacoes() async{

    var nacoesUri = Uri(
      scheme: 'https',
      host: 'random-data-api.com',
      path: 'api/nation/random_nation',
      queryParameters: {'size': '$querySize'}
    );


    var jsonString = await http.read(nacoesUri);
    var nacoesJson = jsonDecode(jsonString);



    tableStateNotifier.value = {
      "objects": nacoesJson,
      "props": [
        "nationality",
        "language",
        "capital"
      ],
      "columnsNames": [
        "Nacionalidade",
        "Linguagem",
        "Capital"
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
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
        colorScheme: const ColorScheme.dark(),
      ),
      
      debugShowCheckedModeBanner:false,

      home: Scaffold(
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
                  child: MyCustomForm(callback: dataService.setQuerySize,),
                  ),
              ),

    
              ValueListenableBuilder(
                valueListenable: dataService.tableStateNotifier,
                builder:(_, value, __){
                
                  return Center(
                    
                    child:  (
                      DataTableWidget(
                        objects: dataService.tableStateNotifier.value["objects"],
                        // jsonObjects:value["objects"], 
                        propertyNames: value["props"], 
                        columnNames: value["columnsNames"]
                      )
                    )
                  );
                }
              ),
            ],
            ),
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
  final List columnNames;
  final List propertyNames;

  DataTableWidget( {this.objects = const [], this.columnNames = const [], this.propertyNames= const []});

  @override
  Widget build(BuildContext context) {
    return DataTable(

      columns: columnNames.map( 
        (name) => DataColumn(
          label: Expanded(
            child: Text(name, style: TextStyle(fontWeight: FontWeight.bold))
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

// class MyCustomForm extends StatefulWidget {
//   const MyCustomForm({super.key});

//   @override
//   MyCustomFormState createState() {
//     return MyCustomFormState();
//   }
// }

class MyCustomForm extends HookWidget {
  dynamic callback; 
  // var _opcao;
  final _formKey = GlobalKey<FormState>();

  MyCustomForm({super.key, this.callback});
  
  // int get newSize => 5;



  @override
  Widget build(BuildContext context) {
    var state = useState(5);
    return Form(
      child: Column(
        children: [
          DropdownButtonFormField<int>(
            decoration: const InputDecoration(labelText: 'Quantidade de itens'),
            value: state.value,
            onChanged: (newValue) {
              state.value = newValue ?? 5;
              callback(state.value);

              // setState(() {
              //   _opcao = dataService.querySize;
              // }
              // );
            },
            items: const [
              DropdownMenuItem<int>(
                value: 5,
                child: Text('5 Itens'),
              ),
              DropdownMenuItem<int>(
                value: 10,
                child: Text('10 Itens'),
              ),
              DropdownMenuItem<int>(
                value: 15,
                child: Text('15 Itens'),
              ),
            ],
          ),

          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: ElevatedButton(
              onPressed: () {
                  dataService.setQuerySize(state.value);
                  dataService.querySize = state.value;
                if (_formKey.currentState != null && _formKey.currentState!.validate()) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Processando')),
                  );
                }
              },
              child: const Text('Atribuir'),
            ),
          ),
        ],
      ),
    );
  }
}