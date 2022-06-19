
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:projeto_treinamento/features/logIn_SingUpUsuario/esqueceuSenhaUsuario/views/esqueceuSenhaUsuarioBody.dart';
import 'package:projeto_treinamento/features/logIn_SingUpUsuario/logInUsuario/views/logInBodyUsuario.dart';


class EsqueceuSenhaUsuarioScreen extends StatelessWidget {
  EsqueceuSenhaUsuarioScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: EsqueceuSenhaUsuarioBody(),
    );
  }
}

