import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:projeto_treinamento/businessModels/businessModelUsuario.dart';
import 'package:projeto_treinamento/features/hub/views/viewHubBody.dart';
import 'package:projeto_treinamento/framework/view.dart';

import 'viewActionsHub.dart';
import 'viewModelHub.dart';

class ViewHub extends View<ViewModelHub, ViewActionsHub> {
  ViewHub({
    Key? key,
    ViewModelHub? viewModel,
    required ViewActionsHub viewActions,
  }) : super(key: key, viewModel: viewModel, viewActions: viewActions);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        //appBar: AppBar(
        //  title: Text("HUB"),
        //),
        body: _buildBody(context),
      ),
    );
  }

  _buildBody(BuildContext context) {
    if (viewModel == null) {
      return Center(
        child: CircularProgressIndicator(),
      );
    } else {
      BusinessModelUsuario usuario = viewModel!.usuario;
      return ViewHubBody(viewModel: viewModel!, viewActions: viewActions);
    }
  }
}
