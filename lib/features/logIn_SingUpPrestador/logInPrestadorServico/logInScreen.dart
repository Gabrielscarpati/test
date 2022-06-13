import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

import 'views/logInBody.dart';


class LogInScreenPrestador extends StatelessWidget {
  const LogInScreenPrestador({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LogInBodyPrestador(),
    );
  }
}

