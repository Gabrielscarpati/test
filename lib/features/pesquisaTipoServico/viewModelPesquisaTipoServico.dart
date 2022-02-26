import 'package:flutter/cupertino.dart';
import 'package:projeto_treinamento/businessModels/businessModelTiposDeServico.dart';
import 'package:projeto_treinamento/framework/viewModelLista.dart';


class ViewModelPesquisaTipoServico extends ViewModelLista<BusinessModelTiposDeServico> {
  final TextEditingController controlerFieldPesquisa = TextEditingController();
  String mensagemDeErro = '';

  ViewModelPesquisaTipoServico({
    required List<BusinessModelTiposDeServico> listaCompleta,
  }) : super(listaVisivel: List.empty(growable: true)..addAll(listaCompleta), listaCompleta: listaCompleta);

}
