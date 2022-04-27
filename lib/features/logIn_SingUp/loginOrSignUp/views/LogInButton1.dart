import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../logIn/logInScreen.dart';


class LogInButton1 extends StatefulWidget {
  const LogInButton1({Key? key}) : super(key: key);

  @override
  _LogInButtonState createState() => _LogInButtonState();
}

class _LogInButtonState extends State<LogInButton1> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      child: Ink(
        decoration: BoxDecoration(
            gradient: LinearGradient(colors: [Colors.blue.shade900,Colors.blue.shade500,  Colors.blue.shade400],
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
            ),
            borderRadius: BorderRadius.circular(30.0)
        ),

        child: Container(
          constraints: BoxConstraints(maxWidth: 350.0, minHeight: 50.0),
          alignment: Alignment.center,
          child: Text(
            'Log In',
            textAlign: TextAlign.center,
            style: TextStyle(
                color: Colors.white,
                fontSize: 20.0,
                fontWeight: FontWeight.bold
            ),
          ),
        ),
      ),
      onPressed: () {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => LogInScreen()
        ));
      },

      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.all(0),
        shape: new RoundedRectangleBorder(
          borderRadius: new BorderRadius.circular(30.0),
        ),
      ),
    );
  }
}

