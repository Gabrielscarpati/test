import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:projeto_treinamento/features/infoDadosPrestador/views/InfoDadosPrestadorBody.dart';
import 'package:projeto_treinamento/features/infoDadosPrestador/views/buttonSalvarInfoUsuario.dart';
import 'package:projeto_treinamento/framework/view.dart';
import '../../util/libraryComponents/circularProgressIndicatorPersonalizado.dart';
import 'viewActionsInfoDadosPrestador.dart';
import 'viewModelInfoDadosPrestador.dart';

class ViewInfoDadosPrestador extends View<ViewModelInfoDadosPrestador, ViewActionsInfoDadosPrestador> {
  ViewInfoDadosPrestador({
    Key? key,
    ViewModelInfoDadosPrestador? viewModel,
    required ViewActionsInfoDadosPrestador viewActions,
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
          child: ButtonSaveInfoDadosPrestador(),
        ),
      ),
    );
  }

  _buildBody(BuildContext context) {
    if (viewModel == null) {
      return Center(
        child: CircularProgressIndicatorPersonalizado(),
      );
    } else {
      return InfoDadosPrestadorBody(viewModel: this.viewModel!, viewActions: viewActions);
    }
  }
}


//