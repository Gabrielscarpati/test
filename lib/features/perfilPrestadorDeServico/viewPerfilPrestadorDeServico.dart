import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:projeto_treinamento/features/perfilPrestadorDeServico/views/buttonSalvarPerfilPrestadorDeServico.dart';
import 'package:projeto_treinamento/features/perfilPrestadorDeServico/views/perfilPrestadorDeServicoBody.dart';

import 'package:projeto_treinamento/framework/view.dart';
import 'viewActionsPerfilPrestadorDeServico.dart';
import 'viewModelPerfilPrestadorDeServico.dart';

class ViewPerfilPrestadorDeServico extends View<
    ViewModelPerfilPrestadorDeServico, ViewActionsPerfilPrestadorDeServico> {
  ViewPerfilPrestadorDeServico({
    Key? key,
    ViewModelPerfilPrestadorDeServico? viewModel,
    required ViewActionsPerfilPrestadorDeServico viewActions,
  }) : super(key: key, viewModel: viewModel, viewActions: viewActions);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Perfil',
          style: TextStyle(color: Colors.black, fontSize: 20),
        ),
        automaticallyImplyLeading: false,
        leading: IconButton(
          icon: Icon(MdiIcons.arrowLeft),
          onPressed: () {
            Navigator.pop(context, viewModel);
          },
        ),
      ),
      body: _buildBody(context),
      bottomNavigationBar: BottomAppBar(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: ButtonSavePerfilPrestadorDeServico(/*viewActions: viewActions, viewModel: viewModel,*/),
        ),
      ),
    );
  }

  _buildBody(BuildContext context) {
    if (viewModel == null) {
      return Center(
        child: CircularProgressIndicator(),
      );
    } else {
      return PerfilPrestadorDeServicoBody(
          viewModel: this.viewModel!, viewActions: viewActions);
    }
  }
}
