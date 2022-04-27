import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:projeto_treinamento/features/logIn_SingUp/logIn/views/logInBody.dart';


class LogInScreen extends StatefulWidget {
  const LogInScreen({Key? key}) : super(key: key);

  @override
  _ViewHomeScreenState createState() => _ViewHomeScreenState();
}

class _ViewHomeScreenState extends State<LogInScreen> {
  Client client = http.Client();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LogInBody(client: client,),
    );
  }
}

