import '../util/ordenador.dart';

class DecididorCervejaNomeCrescente extends Decididor{
  @override
  bool precisaTrocarAtualPeloProximo(atual, proximo) {
    try{
      return atual["name"].compareTo(proximo["name"]) > 0;
    }
    catch (error){
      return false;
    }    
  }
}

class DecididorCervejaNomeDecrescente extends Decididor{
  @override
  bool precisaTrocarAtualPeloProximo(atual, proximo) {
    try{
      return atual["name"].compareTo(proximo["name"]) < 0;
    }
    catch (error){
      return false;
    }    
  }

}

class DecididorCervejaEstiloCrescente extends Decididor{
  @override
  bool precisaTrocarAtualPeloProximo(atual, proximo) {
    try{
      return atual["style"].compareTo(proximo["style"]) > 0;
    }
    catch (error){
      return false;
    }    
  }

}



class DecididorCervejaEstiloDecrescente extends Decididor{
  @override
  bool precisaTrocarAtualPeloProximo(atual, proximo) {
    try{
      return atual["style"].compareTo(proximo["style"]) < 0;
    }
    catch (error){
      return false;
    }
  }

}

class DecididorCervejaIbuCrescente extends Decididor{
  @override
  bool precisaTrocarAtualPeloProximo(atual, proximo) {
    try{
      return atual["ibu"].compareTo(proximo["ibu"]) > 0;
    }
    catch (error){
      return false;
    }    
  }

}
class DecididorCervejaIbuDecrescente extends Decididor{
  @override
  bool precisaTrocarAtualPeloProximo(atual, proximo) {
    try{
      return atual["ibu"].compareTo(proximo["ibu"]) < 0;
    }
    catch (error){
      return false;
    }    
  }

}



class DecididorCafeNameCrescente extends Decididor{
  @override
  bool precisaTrocarAtualPeloProximo(atual, proximo) {
    try{
      return atual["blend_name"].compareTo(proximo["blend_name"]) > 0;
    }
    catch (error){
      return false;
    }    
  }

}
class DecididorCafeNameDecrescente extends Decididor{
  @override
  bool precisaTrocarAtualPeloProximo(atual, proximo) {
    try{
      return atual["blend_name"].compareTo(proximo["blend_name"]) < 0;
    }
    catch (error){
      return false;
    }    
  }

}


class DecididorCafeOrigemCrescente extends Decididor{
  @override
  bool precisaTrocarAtualPeloProximo(atual, proximo) {
    try{
      return atual["origin"].compareTo(proximo["origin"]) > 0;
    }
    catch (error){
      return false;
    }    
  }

}
class DecididorCafeOrigemDecrescente extends Decididor{
  @override
  bool precisaTrocarAtualPeloProximo(atual, proximo) {
    try{
      return atual["origin"].compareTo(proximo["origin"]) < 0;
    }
    catch (error){
      return false;
    }    
  }

}

class DecididorCafeVariedadeCrescente extends Decididor{
  @override
  bool precisaTrocarAtualPeloProximo(atual, proximo) {
    try{
      return atual["variety"].compareTo(proximo["variety"]) > 0;
    }
    catch (error){
      return false;
    }    
  }

}
class DecididorCafeVariedadeDecrescente extends Decididor{
  @override
  bool precisaTrocarAtualPeloProximo(atual, proximo) {
    try{
      return atual["variety"].compareTo(proximo["variety"]) < 0;
    }
    catch (error){
      return false;
    }    
  }

}



class DecididorNacoesNacionalidadeCrescente extends Decididor{
  @override
  bool precisaTrocarAtualPeloProximo(atual, proximo) {
    try{
      return atual["nationality"].compareTo(proximo["nationality"]) > 0;
    }
    catch (error){
      return false;
    }    
  }

}
class DecididorNacoesNacionalidadeDecrescente extends Decididor{
  @override
  bool precisaTrocarAtualPeloProximo(atual, proximo) {
    try{
      return atual["nationality"].compareTo(proximo["nationality"]) < 0;
    }
    catch (error){
      return false;
    }    
  }

}


class DecididorNacoesLanguageCrescente extends Decididor{
  @override
  bool precisaTrocarAtualPeloProximo(atual, proximo) {
    try{
      return atual["language"].compareTo(proximo["language"]) > 0;
    }
    catch (error){
      return false;
    }    
  }

}
class DecididorNacoesLanguageDecrescente extends Decididor{
  @override
  bool precisaTrocarAtualPeloProximo(atual, proximo) {
    try{
      return atual["language"].compareTo(proximo["language"]) < 0;
    }
    catch (error){
      return false;
    }    
  }

}

class DecididorNacoesCapitalCrescente extends Decididor{
  @override
  bool precisaTrocarAtualPeloProximo(atual, proximo) {
    try{
      return atual["capital"].compareTo(proximo["capital"]) > 0;
    }
    catch (error){
      return false;
    }    
  }

}
class DecididorNacoesCapitalDecrescente extends Decididor{
  @override
  bool precisaTrocarAtualPeloProximo(atual, proximo) {
    try{
      return atual["capital"].compareTo(proximo["capital"]) < 0;
    }
    catch (error){
      return false;
    }    
  }

}



class DecididorSangueTipoCrescente extends Decididor{
  @override
  bool precisaTrocarAtualPeloProximo(atual, proximo) {
    try{
      return atual["type"].compareTo(proximo["type"]) > 0;
    }
    catch (error){
      return false;
    }    
  }

}
class DecididorSangueTipoDecrescente extends Decididor{
  @override
  bool precisaTrocarAtualPeloProximo(atual, proximo) {
    try{
      return atual["type"].compareTo(proximo["type"]) < 0;
    }
    catch (error){
      return false;
    }    
  }

}


class DecididorSangueRhCrescente extends Decididor{
  @override
  bool precisaTrocarAtualPeloProximo(atual, proximo) {
    try{
      return atual["rh_factor"].compareTo(proximo["rh_factor"]) > 0;
    }
    catch (error){
      return false;
    }    
  }

}
class DecididorSangueRhDecrescente extends Decididor{
  @override
  bool precisaTrocarAtualPeloProximo(atual, proximo) {
    try{
      return atual["rh_factor"].compareTo(proximo["rh_factor"]) < 0;
    }
    catch (error){
      return false;
    }    
  }

}

class DecididorSangueGrupoCrescente extends Decididor{
  @override
  bool precisaTrocarAtualPeloProximo(atual, proximo) {
    try{
      return atual["group"].compareTo(proximo["group"]) > 0;
    }
    catch (error){
      return false;
    }    
  }

}
class DecididorSangueGrupoDecrescente extends Decididor{
  @override
  bool precisaTrocarAtualPeloProximo(atual, proximo) {
    try{
      return atual["group"].compareTo(proximo["group"]) < 0;
    }
    catch (error){
      return false;
    }    
  }

}
