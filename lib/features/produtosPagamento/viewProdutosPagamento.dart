import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:projeto_treinamento/features/produtosPagamento/viewModelProdutosPagamento.dart';
import 'package:projeto_treinamento/features/produtosPagamento/views/viewHubProdutosPagamento.dart';
import 'package:projeto_treinamento/framework/view.dart';

import '../../businessModels/businessModelUsuario.dart';
import '../../util/libraryComponents/circularProgressIndicatorPersonalizado.dart';
import 'viewActionsProdutosPagamento.dart';

class ViewProdutosPagamento
    extends View<ViewModelProdutosPagamento, ViewActionsProdutosPagamento> {
  ViewProdutosPagamento({
    Key? key,
    ViewModelProdutosPagamento? viewModel,
    required ViewActionsProdutosPagamento viewActions,
  }) : super(key: key, viewModel: viewModel, viewActions: viewActions);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildBody(context),
    );
  }

  _buildBody(BuildContext context) {
    if (viewModel == null) {
      return Center(
        child: CircularProgressIndicatorPersonalizado(),
      );
    } else {
      return ViewBodyProdutosPagamento(
          viewModel: viewModel!, viewActions: viewActions);
    }
  }
}
