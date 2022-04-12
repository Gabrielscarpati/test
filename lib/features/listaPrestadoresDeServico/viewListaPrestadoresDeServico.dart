import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:projeto_treinamento/features/listaPrestadoresDeServico/views/actionsListaPrestadoresDeServico.dart';
import 'package:projeto_treinamento/features/listaPrestadoresDeServico/views/bodyListaPrestadoresDeServico.dart';
import 'package:projeto_treinamento/features/listaPrestadoresDeServico/views/titleListaPrestadoresDeServico.dart';
import 'package:projeto_treinamento/framework/view.dart';

import '../../util/libraryComponents/colors/colors.dart';
import 'viewActionsListaPrestadoresDeServico.dart';
import 'viewModelListaPrestadoresDeServico.dart';

class ViewListaPrestadoresDeServico extends View<ViewModelListaPrestadoresDeServico, ViewActionsListaPrestadoresDeServico> {
  const ViewListaPrestadoresDeServico({
    Key? key,
    ViewModelListaPrestadoresDeServico? viewModel,
    required ViewActionsListaPrestadoresDeServico viewActions,
  }) : super(key: key, viewModel: viewModel, viewActions: viewActions);

  @override
  Widget build(BuildContext context) {
    if (viewModel == null) {
      return Center(
        child: CircularProgressIndicator(),
      );
    } else {
      return Scaffold(
        appBar: AppBar(
          title: TitleListaDePrestadoresDeServico(viewModel: this.viewModel!),
          actions: [ActionsListaPrestadoresDeServico(viewModel: this.viewModel!, viewActions: this.viewActions)],
          backgroundColor: ColorAppBar,
          iconTheme: IconThemeData(
            color: Colors.white,
          ),
        ),
        body: BodyListaPrestadoresDeServico(
          viewModel: this.viewModel!,
          viewActions: this.viewActions,
        ),
      );
    }
  }
}
