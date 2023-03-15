// void main(){
//   class Produto{
//     double preco;
//     String nome;

//     Produto({th})

//   }
// }

class Pessoa {
  String nome;
  int idade;

  Pessoa({required this.nome, required this.idade});

  void dizerOla() {
    print('Olá, meu nome é $nome e eu tenho $idade anos.');
  }
  
}
// required

void main() {
  Pessoa pessoa = Pessoa(nome:"Victor", idade:19);

  pessoa.dizerOla();
}
