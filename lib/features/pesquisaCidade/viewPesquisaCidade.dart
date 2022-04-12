import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:projeto_treinamento/features/pesquisaCidade/views/viewPesquisaCidadeBody.dart';
import 'package:projeto_treinamento/framework/view.dart';

import '../../util/libraryComponents/colors/colors.dart';
import 'viewActionsPesquisaCidade.dart';
import 'viewModelPesquisaCidade.dart';

class ViewPesquisaCidade extends View<ViewModelPesquisaCidade, ViewActionsPesquisaCidade> {
  ViewPesquisaCidade({
    Key? key,
    ViewModelPesquisaCidade? viewModel,
    required ViewActionsPesquisaCidade viewActions,
  }) : super(key: key, viewModel: viewModel, viewActions: viewActions);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Selecione uma cidade",
        style: TextStyle(color: Colors.white),),
          backgroundColor: ColorAppBar,
        iconTheme: IconThemeData(
          color: Colors.white,
        ),
      ),
      body: _buildBody(context),

    );
  }

  _buildBody(BuildContext context) {
    if (viewModel == null) {
      return Center(
        child: CircularProgressIndicator(),
      );
    } else {
      return Center(
          child: ViewPesquisaCidadeBody(
        context,
        viewActions: viewActions,
        viewModel: viewModel!,
      ));
    }
  }
}
