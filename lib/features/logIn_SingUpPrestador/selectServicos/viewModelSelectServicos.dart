import 'package:flutter/cupertino.dart';
import 'package:projeto_treinamento/businessModels/businessModelCidade.dart';
import '../../../framework/viewModelLista.dart';
import 'featureModelSelectServicos.dart';

class ViewModelSelectServicos extends ViewModelLista<BusinessModelCidade> {
  final TextEditingController controlerFieldPesquisa = TextEditingController();
  final List<BusinessModelCidade> cidades;
  String mensagemDeErro = '';

  List<BusinessModelCidade> cidadesSelecionadas;

  ViewModelSelectServicos({
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
