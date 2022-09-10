import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:projeto_treinamento/appVerifyIdentity/features/listaPrestadoresDeServico/views/bodyListaVerifyIdentity.dart';
import 'package:projeto_treinamento/appVerifyIdentity/features/listaPrestadoresDeServico/views/titleListaVerifyIdentity.dart';
import 'package:projeto_treinamento/framework/view.dart';
import '../../../features/listaPrestadoresDeServico/views/titleListaPrestadoresDeServico.dart';
import '../../../util/libraryComponents/circularProgressIndicatorPersonalizado.dart';
import '../../../util/libraryComponents/colors/colors.dart';
import 'viewActionsListaVerifyIdentity.dart';
import 'viewModelListaVerifyIdentity.dart';

class ViewListaVerifyIdentity extends View<ViewModelListaVerifyIdentity, ViewActionsListaVerifyIdentity> {
  const ViewListaVerifyIdentity({
    Key? key,
    ViewModelListaVerifyIdentity? viewModel,
    required ViewActionsListaVerifyIdentity viewActions,
  }) : super(key: key, viewModel: viewModel, viewActions: viewActions);

  @override
  Widget build(BuildContext context) {
    if (viewModel == null) {
      return Scaffold(
        body: Center(
          child: CircularProgressIndicatorPersonalizado(),
        ),
      );
    } else {
      return Scaffold(
        appBar: AppBar(
          title: TitleListaVerifyIdentity(viewModel: this.viewModel!),
          backgroundColor: ColorAppBar,
        ),

        body: BodyListaVerifyIdentity(
          viewModel: this.viewModel!,
          viewActions: this.viewActions,
        ),
      );
    }
  }
}
