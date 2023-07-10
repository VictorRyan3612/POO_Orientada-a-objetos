import '../util/ordenador.dart';


class DecididorGeral extends Decididor{
  String prop; 
  bool ordenadoCrescente;
  DecididorGeral({required this.prop, required this.ordenadoCrescente});

  @override
  bool precisaTrocarAtualPeloProximo(atual, proximo) {
    try{
      if (ordenadoCrescente == false) {
        return atual[prop].compareTo(proximo[prop]) > 0;
      } 
      else {
        return atual[prop].compareTo(proximo[prop]) < 0;
      }
    }
    catch (error){
      return false;
    }    
  }
}