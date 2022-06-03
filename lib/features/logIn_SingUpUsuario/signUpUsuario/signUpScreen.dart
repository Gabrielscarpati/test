import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:projeto_treinamento/features/logIn_SingUpUsuario/signUpUsuario/views/signUpBody.dart';




class ViewSignUpUsuario extends StatefulWidget {
  const ViewSignUpUsuario({Key? key}) : super(key: key);

  @override
  _ViewSignUpUsuario createState() => _ViewSignUpUsuario();
}

class _ViewSignUpUsuario extends State<ViewSignUpUsuario> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SignUpUsuarioBody(),
    );
  }
}

