import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../../loginOrSignUpPrestadorServico/viewLogInOrSignUpPrestadorServico.dart';


class BackArrowSignUpPart2WorkerInformation extends StatefulWidget {
  const BackArrowSignUpPart2WorkerInformation({Key? key}) : super(key: key);

  @override
  _BackArrowSignUpPart2WorkerInformation createState() => _BackArrowSignUpPart2WorkerInformation();
}

class _BackArrowSignUpPart2WorkerInformation extends State<BackArrowSignUpPart2WorkerInformation> {
  @override
  Widget build(BuildContext context) {
    return TextButton.icon(onPressed: () {
      Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => ViewLogInOrSignUpPrestadorServico()
      ));} ,
      icon:  Icon(Icons.arrow_back, color: Color(0xff4cf2c7), size: 30.0),
      label: Text(''),
    );
  }
}
