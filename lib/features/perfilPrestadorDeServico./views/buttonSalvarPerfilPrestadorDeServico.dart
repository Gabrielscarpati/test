import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:projeto_treinamento/features/infoPrestadorDeServico/viewActionsInfoPrestadorDeServico.dart';
import 'package:projeto_treinamento/features/perfilPrestadorDeServico/viewActionsPerfilPrestadorDeServico.dart';
import 'package:projeto_treinamento/features/perfilPrestadorDeServico/viewModelPerfilPrestadorDeServico.dart';
import '../../hub/presenterHub.dart';

class ButtonSavePerfilPrestadorDeServico extends StatefulWidget {
  //final ViewActionsPerfilPrestadorDeServico viewActions;
  //final ViewModelPerfilPrestadorDeServico viewModel;
  const ButtonSavePerfilPrestadorDeServico({Key? key,
    //required this.viewActions,
    //required this.viewModel
  }) : super(key: key);

  @override
  _ButtonSavePerfilPrestadorDeServicoState createState() =>
      _ButtonSavePerfilPrestadorDeServicoState();
}

class _ButtonSavePerfilPrestadorDeServicoState
    extends State<ButtonSavePerfilPrestadorDeServico> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      margin: EdgeInsets.symmetric(horizontal: 50),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ElevatedButton(
            child: Ink(
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Colors.blue.shade900,
                      Colors.blue.shade500,
                      Colors.blue.shade400
                    ],
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                  ),
                  borderRadius: BorderRadius.circular(30.0)),
              child: Container(
                constraints: BoxConstraints(maxWidth: 350.0, minHeight: 50.0),
                alignment: Alignment.center,
                child: Text(
                  'Salvar',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
            onPressed: () {
              //widget.viewActions.updatePrestadorInformation(viewModel: widget.viewModel);

              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => PresenterHub.presenter()));
            },
            style: ElevatedButton.styleFrom(
              padding: EdgeInsets.all(0),
              shape: new RoundedRectangleBorder(
                borderRadius: new BorderRadius.circular(30.0),
              ),
            ),
          ),
        ],
      ),
    );
  }
}