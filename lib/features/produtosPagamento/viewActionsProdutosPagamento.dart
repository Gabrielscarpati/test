import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:projeto_treinamento/businessModels/businessModelCidade.dart';

import 'package:projeto_treinamento/businessModels/businessModelPrincipaisTiposDeServicoCidade.dart';
import 'package:projeto_treinamento/businessModels/businessModelUsuario.dart';

import 'package:projeto_treinamento/features/listaPrestadoresDeServico/presenterListaPrestadoresDeServico.dart';

import 'package:projeto_treinamento/features/pesquisaTipoServico/presenterPesquisaTipoServico.dart';
import 'package:projeto_treinamento/features/produtosPagamento/viewModelProdutosPagamento.dart';
import 'package:projeto_treinamento/framework/pipe.dart';
import 'package:projeto_treinamento/framework/viewActions.dart';
import 'package:projeto_treinamento/providers/cidade/providerCidade.dart';

import '../../util/getCodigoCidade.dart';

import '../pesquisaCidade/presenterPesquisaCidade.dart';
import 'blocEventProdutosPagamento.dart';

class ViewActionsProdutosPagamento
    extends ViewActions<BlocEventProdutosPagamento> {
  ViewActionsProdutosPagamento(Pipe<BlocEventProdutosPagamento> blocPipeIn)
      : super(blocPipeIn);

  void AtualizaTelatProdutosPagamento(ViewModelProdutosPagamento viewModel) {
    BlocEventProdutosPagamentoAtualizaViewModel blocEvent =
        BlocEventProdutosPagamentoAtualizaViewModel(viewModel: viewModel);
    blocPipeIn.send(blocEvent);
  }
}
