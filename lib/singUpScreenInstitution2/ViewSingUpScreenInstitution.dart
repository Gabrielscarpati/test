import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:projeto_treinamento/singUpScreenInstitution2/views/bodySingUpScreenInstitution.dart';


class singUpScreenInstitution extends StatefulWidget {
  const singUpScreenInstitution({Key? key}) : super(key: key);

  @override
  _ViewHomeScreenState createState() => _ViewHomeScreenState();
}

class _ViewHomeScreenState extends State<singUpScreenInstitution> {
  @override
  Widget build(BuildContext context) {
    //final user = UserData.myUser;
    return Scaffold(
      backgroundColor: Colors.white,
      body:  BodySingUpScreenInstitution(),

    );
  }
}
