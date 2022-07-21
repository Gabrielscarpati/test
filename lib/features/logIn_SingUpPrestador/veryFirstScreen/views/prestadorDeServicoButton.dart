import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../../util/libraryComponents/colors/colorGradient.dart';
import '../../loginOrSignUpPrestadorServico/viewLogInOrSignUpPrestadorServico.dart';

class PrestadorDeServicoButton extends StatelessWidget {
  const PrestadorDeServicoButton({Key? key}) : super(key: key);


  Widget build(BuildContext context) {
    return ElevatedButton(
      child: Ink(
        decoration: BoxDecorationColorGradientButton(context),

        child: Container(
          constraints: BoxConstraints(maxWidth: 350.0, minHeight: 50.0),
          alignment: Alignment.center,
          child: Text(
            'Prestar serviços',
            textAlign: TextAlign.center,
            style: TextStyle(
                color: Colors.white,
                fontSize: 20.0,
                fontWeight: FontWeight.bold
            ),
          ),
        ),
      ),
      onPressed: ()  {


        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => ViewLogInOrSignUpPrestadorServico()
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

