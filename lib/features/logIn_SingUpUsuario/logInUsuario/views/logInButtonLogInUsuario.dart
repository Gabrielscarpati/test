import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../../util/libraryComponents/colors/colorGradient.dart';

class LogInButtonLogInScreen extends StatefulWidget {
  const LogInButtonLogInScreen({Key? key}) : super(key: key);

  @override
  _SignUpButtonState createState() => _SignUpButtonState();
}

class _SignUpButtonState extends State<LogInButtonLogInScreen> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      child: Ink(
        decoration: BoxDecorationColorGradient(context),
        child: Container(
          constraints: BoxConstraints(maxWidth: 350.0, minHeight: 50.0),
          alignment: Alignment.center,
          child: Text(
            'Log in',
            textAlign: TextAlign.center,
            style: TextStyle(
                color: Colors.white,
                fontSize: 20.0,
                fontWeight: FontWeight.bold),
          ),
        ),
      ),
      onPressed: () {},
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.all(0),
        shape: new RoundedRectangleBorder(
          borderRadius: new BorderRadius.circular(30.0),
        ),
      ),
    );
  }
}
