import '../util/ordenador.dart';



class DecididorGeralCrescente extends Decididor{
  String prop; 
  DecididorGeralCrescente({required this.prop});

  @override
  bool precisaTrocarAtualPeloProximo(atual, proximo) {
    try{
      return atual[prop].compareTo(proximo[prop]) > 0;
    }
    catch (error){
      return false;
    }    
  }
}

class DecididorGeralDecrescente extends Decididor{
  String prop; 
  DecididorGeralDecrescente({required this.prop});

  @override
  bool precisaTrocarAtualPeloProximo(atual, proximo) {
    try{
      return atual[prop].compareTo(proximo[prop]) < 0;
    }
    catch (error){
      return false;
    }    
  }
}