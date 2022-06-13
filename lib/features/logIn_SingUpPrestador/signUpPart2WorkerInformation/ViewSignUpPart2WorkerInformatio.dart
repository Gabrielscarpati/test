import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../signUpPart2WorkerInformation/views/bodySignUpPart2WorkerInformation.dart';


class SingUpPart2WorkerInformation extends StatelessWidget {
  const SingUpPart2WorkerInformation({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    //final user = UserData.myUser;
    return Scaffold(
      backgroundColor: Colors.white,
      body:  BodySignUpPart2WorkerInformation(),

    );
  }
}
