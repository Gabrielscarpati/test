import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:projeto_treinamento/features/logIn_SingUp/pesquisaCidade/views/buttonGoSignUpScreenPart4.dart';
import 'package:projeto_treinamento/features/logIn_SingUp/signUpPart3ChooseCity/views/viewSearchCitySignUpBody.dart';

import '../../hub/presenterHub.dart';

class ViewSignUpPart3ChooseCity extends StatelessWidget {
  const ViewSignUpPart3ChooseCity({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.blueAccent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(30),
          ),
        ),

        title:Text("Selecione a(s) cidades que\n voce prestara o servico",style: TextStyle(color: Colors.white
           ),
         ),
      ),
       body: _buildBody(context),
      bottomNavigationBar: BottomAppBar(

        child: ButtonGoSignUpScreenPart4()
      )
    );
  }
  _buildBody(BuildContext context) {
      return ViewSearchCitySignUpBody();
    }
}
