import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../util/libraryComponents/colors/colorGradient.dart';
import '../../logInPrestadorServico/logInScreen.dart';



class ButtonLogInOrSignUpPrestadorServicoBodyLogIn extends StatelessWidget {
  const ButtonLogInOrSignUpPrestadorServicoBodyLogIn({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      child: Ink(
        decoration: BoxDecorationColorGradientButton(context),
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
            builder: (context) => LogInScreenPrestador()
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

