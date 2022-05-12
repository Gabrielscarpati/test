import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../../loginOrSignUp/views/logInSingUpBody.dart';

class BackArrowLogInScreen extends StatefulWidget {
  const BackArrowLogInScreen({Key? key}) : super(key: key);

  @override
  _LogInButtonState createState() => _LogInButtonState();
}

class _LogInButtonState extends State<BackArrowLogInScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return TextButton.icon(onPressed: () {
      Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => LogInOrSingUpBody()
      ));} ,
      icon:  Icon(Icons.arrow_back, color: Color(0xff4cf2c7), size: 30.0),
      label: Text(''),
    );
  }
}
