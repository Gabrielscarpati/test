import 'package:flutter/cupertino.dart';
import 'package:projeto_treinamento/businessModels/businessModelCidade.dart';
import 'package:projeto_treinamento/businessModels/businessModelIcone.dart';
import 'package:projeto_treinamento/businessModels/businessModelPrestadorDeServicos.dart';
import 'package:projeto_treinamento/businessModels/businessModelTiposDeServico.dart';
import 'package:projeto_treinamento/framework/viewModelLista.dart';

class ViewModelListaPrestadoresDeServico extends ViewModelLista<BusinessModelPrestadorDeServicos> {
  final BusinessModelCidade cidade;
  final BusinessModelTiposDeServico tiposDeServico;
  final TextEditingController controlerFieldPesquisa = TextEditingController();

  ViewModelListaPrestadoresDeServico({
    required List<BusinessModelPrestadorDeServicos> listaCompleta,
    required this.cidade,
    required this.tiposDeServico,
  }) : super(listaVisivel: List.empty(growable: true)..addAll(listaCompleta), listaCompleta: listaCompleta);
}
