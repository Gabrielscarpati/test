import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:projeto_treinamento/features/logIn_SingUpPrestador/singUpPart5PrestadorDocumentos/views/bodySignUpPart5PrestadorDocumentos.dart';

class SignUpPart5PrestadorDocumentos extends StatelessWidget {


  const SignUpPart5PrestadorDocumentos({Key? key,

  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: BodySignUpPart5PrestadorDocumentos(),
    );
  }
}
