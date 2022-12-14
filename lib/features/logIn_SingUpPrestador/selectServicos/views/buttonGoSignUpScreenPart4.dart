import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:projeto_treinamento/util/libraryComponents/popUps/popUpListaSelectServicos.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';
import '../../../../util/libraryComponents/colors/colorGradient.dart';
import '../../signUpEplicandoTelaDocumentos/viewSignUpEplicandoTelaDocumentos.dart';
import '../../singUpPart5PrestadorDocumentos/signUpPart5PrestadorDocumentos.dart';
import '../viewActionsSelectServicos.dart';
import '../viewModelSelectServicos.dart';

class ButtonGoSignUpScreenSelectServicos extends StatelessWidget {
  final ViewActionsSelectServicos viewActions;
  final ViewModelSelectServicos viewModel;
   ButtonGoSignUpScreenSelectServicos({Key? key,
    required this.viewActions,
    required this.viewModel,
  }) : super(key: key);
  final RoundedLoadingButtonController _btnController = RoundedLoadingButtonController();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      margin: EdgeInsets.symmetric(horizontal: 50),

      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,

        children: [
          RoundedLoadingButton(
            controller: _btnController,
            child: Ink(
              decoration: BoxDecorationColorGradientButton(context),
              child: Container(
                constraints: BoxConstraints(
                    maxWidth: 350.0, minHeight: 50.0),
                alignment: Alignment.center,
                child: Text(
                  'Continuar',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
            onPressed: () {
              this.viewActions.savarListaSelecionadaFirebase(viewModel);
              if(viewModel.cidadesSelecionadas.length < 1){
                mostrarErroEmailInvalido(context);
              }
              else{
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => ViewsignUpEplicandoTelaDocumentos()));
              }
              _btnController.reset();
            },
          )
        ],
      ),
    );
  }
  Future mostrarErroEmailInvalido(context) => showDialog(
    context: context,
    builder: (context) => PopUpListaSelectServicos(),
  );
}
