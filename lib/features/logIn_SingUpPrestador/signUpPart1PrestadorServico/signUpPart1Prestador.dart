import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../signUpPart1PrestadorServico/views/signUpBody.dart';

class SignUpPart1 extends StatefulWidget {
  const SignUpPart1({Key? key}) : super(key: key);

  @override
  _ViewHomeScreenState createState() => _ViewHomeScreenState();
}

class _ViewHomeScreenState extends State<SignUpPart1> {
  Client client = http.Client();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SignUpPart1Body(),
    );
  }
}

