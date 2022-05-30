import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'views/logInSingUpBody.dart';


class ViewLogInOrSignUpUsuario extends StatelessWidget {
  const ViewLogInOrSignUpUsuario({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LogInOrSignUpUsuarioBody(),
    );
  }
}

