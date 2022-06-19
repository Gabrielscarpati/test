import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';




class BackArrowEsqueceuSenhaPrestador extends StatelessWidget {
  const BackArrowEsqueceuSenhaPrestador({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return TextButton.icon(onPressed: () {
      Navigator.of(context).pop();
          } ,
      icon:  Icon(Icons.arrow_back, color: Color(0xff4cf2c7), size: 30.0),
      label: Text(''),
    );
  }
}
