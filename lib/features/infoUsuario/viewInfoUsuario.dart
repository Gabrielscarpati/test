import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:projeto_treinamento/features/infoUsuario/views/InfoUsuarioBody.dart';
import 'package:projeto_treinamento/features/infoUsuario/views/buttonSalvarInfoUsuario.dart';
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
        title: Text('Perfil',
          style: TextStyle(color:
          Colors.black,
              fontSize:20
          ),
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
      bottomNavigationBar:
      BottomAppBar(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: ButtonSaveInfoUsuario(),
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
      return InfoUsuarioBody(viewModel: this.viewModel!, viewActions: viewActions);
    }
  }
}


//