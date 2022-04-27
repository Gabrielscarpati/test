import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:projeto_treinamento/features/logIn_SingUp/loginOrSignUp/views/logInSingUpBody.dart';

class LogInOrSignUpScreen extends StatefulWidget {
  const LogInOrSignUpScreen({Key? key}) : super(key: key);

  @override
  _ViewHomeScreenState createState() => _ViewHomeScreenState();
}

class _ViewHomeScreenState extends State<LogInOrSignUpScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LogInOrSingUpBody(),
    );
  }
}

