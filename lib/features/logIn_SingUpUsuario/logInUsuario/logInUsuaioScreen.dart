import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:projeto_treinamento/features/logIn_SingUpUsuario/logInUsuario/views/logInBodyUsuario.dart';


class LogInUsuaioScreen extends StatelessWidget {
   LogInUsuaioScreen({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LogInBodyUsuario(),
    );
  }
}

