import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:projeto_treinamento/features/logIn_SingUp/singUpPart2WorkerInformation/views/bodySingUpScreenInstitution.dart';


class SingUpPart2WorkerInformation extends StatefulWidget {
  const SingUpPart2WorkerInformation({Key? key}) : super(key: key);

  @override
  _ViewHomeScreenState createState() => _ViewHomeScreenState();
}

class _ViewHomeScreenState extends State<SingUpPart2WorkerInformation> {
  @override
  Widget build(BuildContext context) {
    //final user = UserData.myUser;
    return Scaffold(
      backgroundColor: Colors.white,
      body:  BodySingUpScreenInstitution(),

    );
  }
}
