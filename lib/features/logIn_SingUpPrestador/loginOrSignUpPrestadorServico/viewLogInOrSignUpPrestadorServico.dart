import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'views/logInSingUpBody.dart';




class ViewLogInOrSignUpPrestadorServico extends StatelessWidget {
  const ViewLogInOrSignUpPrestadorServico({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LogInOrSignUpPrestadorServicoBody(),
    );
  }
}

