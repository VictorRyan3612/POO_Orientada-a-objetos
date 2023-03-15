class Produto {
  double preco;
  String nome;
  
  Produto({required this.nome, required this.preco});
}

class Item {
  Produto produto;
  double quantidade;

  Item({required this.produto, required this.quantidade});

  // double total() {
  //   return quantidade * produto.preco;
  // }

  double total() => quantidade * produto.preco;
}

class Venda {
  String data;
  List<Item> itens;

  Venda({required this.data, required this.itens});

  double total() => itens.fold(0, (sum, e) => sum + e.total());
}

void main() {
  // Venda venda = Venda(nome:"14/18",);

  // Venda.total();
}
