import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'BackArrow.dart';
import 'LogInButton1.dart';
import 'SingUpCharityInstitutionButton.dart';


class LogInSingUpBody extends StatefulWidget {
  const LogInSingUpBody({Key? key}) : super(key: key);

  @override
  _Sample1State createState() => _Sample1State();
}

class _Sample1State extends State<LogInSingUpBody> {
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
              child: SizedBox(child: BackArrow() ),
            ),

            const Padding(
              padding: EdgeInsets.all(10),
              child: Center(
                child:SizedBox(
                  height: 200,
                  width: 200,
                  child: CircleAvatar(
                    radius: 75,
                    child: CircleAvatar(
                      backgroundImage: AssetImage('assets/imageLogo.jpeg'),
                      radius: 95,
                    ),
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
                        Text('Welcome to your help!!!',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold
                          ),),
                        const SizedBox(height: 60,),

                        Text('''Thank you for Signing''',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 24.0,
                              fontWeight: FontWeight.bold
                          ),),
                        Text('''up as a Charity''',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 24.0,
                              fontWeight: FontWeight.bold
                          ),),
                        Text('''Institution!!''',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 24.0,
                              fontWeight: FontWeight.bold
                          ),),
                        const SizedBox(height: 60),
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
                                child: LogInButton1(),
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