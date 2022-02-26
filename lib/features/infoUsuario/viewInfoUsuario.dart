import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:projeto_treinamento/features/hub/viewActionsHub.dart';
import 'package:projeto_treinamento/features/infoUsuario/views/headerInfoUsuario.dart';
import 'package:projeto_treinamento/framework/view.dart';
import 'viewActionsInfoUsuario.dart';
import 'viewModelInfoUsuario.dart';

class ViewInfoUsuario extends View<ViewModelInfoUsuario, ViewActionsInfoUsuario> {
  ViewInfoUsuario({
    Key? key,
    ViewModelInfoUsuario? viewModel,
    required ViewActionsInfoUsuario viewActions,
  }) : super(key: key, viewModel: viewModel, viewActions: viewActions);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: IconButton(
          icon: Icon(MdiIcons.arrowLeft),
          onPressed: () {
            Navigator.pop(context, viewModel);
          },
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
      return HeaderInfoUsuario(viewModel: this.viewModel!, viewActions: viewActions);
    }
  }
}
