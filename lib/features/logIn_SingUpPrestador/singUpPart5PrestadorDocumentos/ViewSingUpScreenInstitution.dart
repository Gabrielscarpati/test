import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:projeto_treinamento/features/logIn_SingUpPrestador/singUpPart5PrestadorDocumentos/views/bodySingUpScreenInstitution.dart';

class SignUpPart5PrestadorDocumentos extends StatefulWidget {
  const SignUpPart5PrestadorDocumentos({Key? key}) : super(key: key);

  @override
  _ViewHomeScreenState createState() => _ViewHomeScreenState();
}

class _ViewHomeScreenState extends State<SignUpPart5PrestadorDocumentos> {
  @override
  Widget build(BuildContext context) {
    //final user = UserData.myUser;
    return Scaffold(
      backgroundColor: Colors.white,
      body: BodySignUpPart2PrestadorDocumentos(),

    );
  }
}
