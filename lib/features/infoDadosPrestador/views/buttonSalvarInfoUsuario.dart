import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:projeto_treinamento/features/hubPrestador/presenterHub.dart';
import 'package:projeto_treinamento/features/infoDadosPrestador/viewActionsInfoDadosPrestador.dart';
import 'package:projeto_treinamento/features/infoDadosPrestador/viewModelInfoDadosPrestador.dart';
import 'package:projeto_treinamento/framework/viewActions.dart';

import '../../logIn_SingUpPrestador/veryFirstScreen/veryFirstScreenUserType.dart';

class ButtonSaveInfoDadosPrestador extends StatefulWidget {
  final ViewActionsInfoDadosPrestador viewActions;
  final ViewModelInfoDadosPrestador viewModel;
  const ButtonSaveInfoDadosPrestador(
      {Key? key, required this.viewActions, required this.viewModel})
      : super(key: key);

  @override
  _ButtonSaveInfoUsuarioState createState() => _ButtonSaveInfoUsuarioState();
}

class _ButtonSaveInfoUsuarioState extends State<ButtonSaveInfoDadosPrestador> {
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
                  'Salvar mudanças',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
            onPressed: () async{
              if(await FirebaseAuth.instance.currentUser?.email == null){
                  Navigator.pushAndRemoveUntil(context,
                    MaterialPageRoute(builder: (BuildContext context) {
                      return ViewVeryFirstScreen();
                    },
                    ),
                        (route)=> false,);
              }
              widget.viewActions
                  .salvarDadosPrestador(widget.viewModel, context);
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
