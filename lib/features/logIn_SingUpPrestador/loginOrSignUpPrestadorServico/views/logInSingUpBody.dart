import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'backArrowLogInOrSignUpPrestadorServico.dart';
import 'buttonLogInOrSignUpPrestadorServicoBodyLogIn.dart';
import 'logInOrSignUpPrestadorServicoBody.dart';


class LogInOrSignUpPrestadorServicoBody extends StatelessWidget {
  const LogInOrSignUpPrestadorServicoBody({Key? key}) : super(key: key);

    @override
    Widget build(BuildContext context) {
    return Scaffold(
      body: Container(

        width: double.infinity,
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                colors: [
                  Colors.blue.shade900,
                  Colors.blue.shade500,
                  Colors.blue.shade400,
                ]
            )
        ),

        child: Column(

          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(12,36,0,0),
              child: SizedBox(child: BackArrowLogInOrSignUpPrestadorServico() ),
            ),

            const Padding(
              padding: EdgeInsets.all(20),
              child: Center(
                child:SizedBox(
                  height: 180,
                  width: 180,
                  child:  CircleAvatar(
                    backgroundImage: AssetImage('assets/logoo.jpg'),
                    radius: 1,
                  ),
                ),
              ),
            ),

            const SizedBox(height: 30),

            Expanded(
              child: Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(60),topRight: Radius.circular(60)),
                ),
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(48),
                    child: Column(
                      children: [
                        Text('Você irá se cadastrar ou ',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 24.0,
                              fontWeight: FontWeight.bold
                          ),),
                        const SizedBox(height: 24,),

                        Text('''Fazer o login ?''',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 24.0,
                              fontWeight: FontWeight.bold
                          ),),
                        const SizedBox(height: 48),
                        // #email, #password
                        Container(
                          child: Column(
                            children: [//click on the one that most fits yoy
                              Container(
                                child: SingUpCharityInstitutionButton(),
                              ),
                              SizedBox(
                                height: 50,
                              ),
                              Container(
                                child: ButtonLogInOrSignUpPrestadorServicoBodyLogIn(),
                              ),
                              SizedBox(

                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}