import 'package:flutter/cupertino.dart';
import 'package:projeto_treinamento/businessModels/businessModelCidade.dart';
import '../../../framework/viewModelLista.dart';
import 'featureModelSelectCidade.dart';

class ViewModelSelectCidade extends ViewModelLista<BusinessModelCidade> {
  final TextEditingController controlerFieldPesquisa = TextEditingController();
  final List<BusinessModelCidade> cidades;
  String mensagemDeErro = '';

  List<BusinessModelCidade> cidadesSelecionadas;

  ViewModelSelectCidade({
    required List<BusinessModelCidade> listaCompleta,
    required this.cidades,
    required this.cidadesSelecionadas,
  }) : super(listaVisivel: List.empty(growable: true)..addAll(cidades), listaCompleta: cidades);

  BusinessModelCidade getCidadePeloCodCidade(int codCidade) {
    for (int i = 0; i < this.cidades.length; i++) {
      if (this.cidades[i].codCidade == codCidade) return this.cidades[i];
    }
    return BusinessModelCidade.vazio();
  }
}

/*
class ViewModelPesquisaCidade extends ViewModelLista<FeatureModelPesquisaCidade> {
  final BusinessModelIcone iconeCidade;
  final TextEditingController controlerFieldPesquisa = TextEditingController();
  String mensagemDeErro = '';

  ViewModelPesquisaCidade({
    required List<FeatureModelPesquisaCidade> listaCompleta,
    required this.iconeCidade,
  }) : super(listaVisivel: List.empty(growable: true)..addAll(listaCompleta), listaCompleta: listaCompleta);

  BusinessModelCidade getCidadePeloCodCidade(int codCidade) {
    for (int i = 0; i < this.listaCompleta.length; i++) {
      if (this.listaCompleta[i].cidade.codCidade == codCidade) return this.listaCompleta[i].cidade;
    }
    return BusinessModelCidade.vazio();
  }
}
*/
