import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:projeto_treinamento/features/pesquisaTipoServico/viewActionsPesquisaTipoServico.dart';
import 'package:projeto_treinamento/features/pesquisaTipoServico/viewModelPesquisaTipoServico.dart';
import 'package:projeto_treinamento/features/pesquisaTipoServico/views/viewPesquisaTipoServicoBody.dart';
import 'package:projeto_treinamento/framework/view.dart';

import '../../util/libraryComponents/colors/colors.dart';

class ViewPesquisaTipoServico extends View<ViewModelPesquisaTipoServico, ViewActionsPesquisaTipoServico> {
  ViewPesquisaTipoServico({
    Key? key,
    ViewModelPesquisaTipoServico? viewModel,
    required ViewActionsPesquisaTipoServico viewActions,
  }) : super(key: key, viewModel: viewModel, viewActions: viewActions);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:   AppBar(title: Text("Selecione o tipo de serviço",
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
          child: ViewPesquisaTipoServicoBody(
            context,
            viewActions: viewActions,
            viewModel: viewModel!,
          ));
    }
  }
}