import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:projeto_treinamento/features/infoDadosPrestador/views/InfoDadosPrestadorBody.dart';
import 'package:projeto_treinamento/features/infoDadosPrestador/views/buttonSalvarInfoUsuario.dart';
import 'package:projeto_treinamento/framework/view.dart';
import '../../util/libraryComponents/circularProgressIndicatorPersonalizado.dart';
import '../../util/libraryComponents/colors/colors.dart';
import '../logIn_SingUpPrestador/veryFirstScreen/veryFirstScreenUserType.dart';
import 'viewActionsInfoDadosPrestador.dart';
import 'viewModelInfoDadosPrestador.dart';

class ViewInfoDadosPrestador
    extends View<ViewModelInfoDadosPrestador, ViewActionsInfoDadosPrestador> {
  ViewInfoDadosPrestador({
    Key? key,
    ViewModelInfoDadosPrestador? viewModel,
    required ViewActionsInfoDadosPrestador viewActions,
  }) : super(key: key, viewModel: viewModel, viewActions: viewActions);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorAppBar,
        title: Text(
          'Edite o seu perfil',
          style: TextStyle(color: Colors.white, fontSize: 20),
        ),
        automaticallyImplyLeading: false,
        leading: IconButton(
          icon: Icon(MdiIcons.arrowLeft, color: Colors.white,),

          onPressed: () async{
            if(await FirebaseAuth.instance.currentUser?.email == null){

                Navigator.pushAndRemoveUntil(context,
                  MaterialPageRoute(builder: (BuildContext context) {
                    return ViewVeryFirstScreen();
                  },
                  ),
                      (route)=> false,);
            }

            Navigator.pop(context, viewModel);
          },
        ),
      ),
      body: _buildBody(context),
      bottomNavigationBar: BottomAppBar(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: viewModel != null
              ? ButtonSaveInfoDadosPrestador(
                  viewActions: viewActions,
                  viewModel: viewModel!,
                )
              : Text(""),
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
      return InfoDadosPrestadorBody(
          viewModel: this.viewModel!, viewActions: viewActions);
    }
  }
}
