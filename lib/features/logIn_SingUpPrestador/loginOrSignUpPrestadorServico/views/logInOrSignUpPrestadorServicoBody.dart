import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../util/libraryComponents/colors/colorGradient.dart';
import '../../signUpPart1PrestadorServico/views/signUpBody.dart';



class SingUpCharityInstitutionButton extends StatefulWidget {
  const SingUpCharityInstitutionButton({Key? key}) : super(key: key);

  @override
  _LogInButtonState createState() => _LogInButtonState();
}

class _LogInButtonState extends State<SingUpCharityInstitutionButton> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      child: Ink(
        decoration: BoxDecorationColorGradientButton(context),

        child: Container(
          constraints: BoxConstraints(maxWidth: 350.0, minHeight: 50.0),
          alignment: Alignment.center,
          child: Text(
            'Cadastre-se aqui',
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
            builder: (context) => SignUpPart1Body()
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
