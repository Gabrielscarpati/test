import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:projeto_treinamento/features/hubPrestador/viewModelHub.dart';
import 'package:projeto_treinamento/features/hubPrestador/views/viewHubBody.dart';
import 'package:projeto_treinamento/framework/view.dart';

import '../../businessModels/businessModelDadosPrestador.dart';
import '../../businessModels/businessModelUsuario.dart';
import '../../util/libraryComponents/circularProgressIndicatorPersonalizado.dart';
import '../../widgets/splashScreen.dart';
import 'viewActionsHub.dart';

class ViewHubPrestador
    extends View<ViewModelHubPrestador, ViewActionsHubPrestador> {
  ViewHubPrestador({
    Key? key,
    ViewModelHubPrestador? viewModel,
    required ViewActionsHubPrestador viewActions,
  }) : super(key: key, viewModel: viewModel, viewActions: viewActions);

  @override
  Widget build(BuildContext context) {
    return _buildBody(context);
  }

  _buildBody(BuildContext context) {
    if (viewModel == null) {
      return Center(
        child: SplashScreen(),
      );
    } else {
      return ViewHubBodyPrestador(
          viewModel: viewModel!, viewActions: viewActions);
    }
  }
}
