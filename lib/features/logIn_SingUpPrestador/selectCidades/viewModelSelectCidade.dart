import 'package:flutter/cupertino.dart';
import 'package:projeto_treinamento/businessModels/businessModelCidade.dart';
import '../../../framework/viewModelLista.dart';
import 'featureModelSelectCidade.dart';

class ViewModelSelectCidade extends ViewModelLista<FeatureModelSelectCidade> {
  final TextEditingController controlerFieldPesquisa = TextEditingController();
  final List<BusinessModelCidade> cidades;
  String mensagemDeErro = '';

  List<BusinessModelCidade> cidadesSelecionadas;

  ViewModelSelectCidade({
    required List<FeatureModelSelectCidade> listaCompleta,
    required this.cidades,
    required this.cidadesSelecionadas,
  }) : super(listaVisivel: List.empty(growable: true)..addAll(listaCompleta), listaCompleta: listaCompleta);
}
