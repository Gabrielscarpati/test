import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:projeto_treinamento/businessModels/businessModelCidade.dart';
import 'package:projeto_treinamento/businessModels/businessModelPrincipaisTiposDeServicoCidade.dart';
import 'package:projeto_treinamento/businessModels/businessModelTiposDeServico.dart';
import 'package:projeto_treinamento/framework/bloc.dart';
import 'package:projeto_treinamento/framework/viewModel.dart';
import 'package:projeto_treinamento/providers/cidade/providerCidade.dart';
import 'package:projeto_treinamento/providers/principaisTiposDeServicoCidade/providerPrincipaisTiposDeServicoCidade.dart';
import 'package:projeto_treinamento/util/cidade.dart';

import 'package:projeto_treinamento/util/tipoDeServico.dart';

import 'blocEventProdutosPagamento.dart';
import 'viewModelProdutosPagamento.dart';

class BlocProdutosPagamento
    extends Bloc<ViewModelProdutosPagamento, BlocEventProdutosPagamento> {
  @override
  void onReceiveBlocEvent(BlocEventProdutosPagamento blocEvent) {
    if (blocEvent is BlocEventHubInicializaViewModeltProdutosPagamento)
      _inicializaViewModel(blocEvent);
    if (blocEvent is BlocEventProdutosPagamentoAtualizaViewModel)
      _atualizaViewModel(blocEvent);
  }

/*  Future<ViewModelProdutosPagamento> _aplicaCidadeNoViewModel(BusinessModelDadostProdutosPagamento tProdutosPagamento, String idCidade) async {
    BusinessModelPrincipaisTiposDeServicoCidade principaisTiposDeServicoCidade = await ProviderPrincipaisTiposDeServicoCidade().getBusinessModel(idCidade);
    print(principaisTiposDeServicoCidade);

    ViewModelProdutosPagamento viewModel = ViewModelProdutosPagamento(
      tProdutosPagamento: tProdutosPagamento,
      cidade: principaisTiposDeServicoCidade.cidade,
      principaisTiposDeServicoCidade: principaisTiposDeServicoCidade,
    );
    return viewModel;
  }*/

  void _inicializaViewModel(
      BlocEventHubInicializaViewModeltProdutosPagamento blocEvent) async {
    ViewModelProdutosPagamento viewModelTmp = ViewModelProdutosPagamento();
    this.sendViewModelOut(viewModelTmp);
  }

  void _atualizaViewModel(
      BlocEventProdutosPagamentoAtualizaViewModel blocEvent) async {
    ViewModelProdutosPagamento viewModelTmp = ViewModelProdutosPagamento();
    this.sendViewModelOut(viewModelTmp);
  }
}
