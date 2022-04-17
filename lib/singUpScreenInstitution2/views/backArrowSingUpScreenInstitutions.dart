import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../../loginSingup2/logInSingUpScreen.dart';

class BackArrowSingUpScreenInstitutions extends StatefulWidget {
  const BackArrowSingUpScreenInstitutions({Key? key}) : super(key: key);

  @override
  _LogInButtonState createState() => _LogInButtonState();
}

class _LogInButtonState extends State<BackArrowSingUpScreenInstitutions> {
  @override
  Widget build(BuildContext context) {
    return TextButton.icon(onPressed: () {
      Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => LogInSingUpScreen()
      ));} ,
      icon:  Icon(Icons.arrow_back, color: Color(0xff4cf2c7), size: 30.0),
      label: Text(''),
    );
  }
}
