import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'CharityInstitutionsButton.dart';
import 'DonorButton.dart';
import 'LogInButton.dart';


class BodyVeryFirstScreen extends StatefulWidget {
  const BodyVeryFirstScreen({Key? key}) : super(key: key);

  @override
  _Sample1State createState() => _Sample1State();
}

class _Sample1State extends State<BodyVeryFirstScreen> {
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
            const SizedBox(height: 50),

            const Padding(
              padding: EdgeInsets.all(20),
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

            const SizedBox(height: 20),

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
                        Text('Are you a?',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold
                          ),),
                        const SizedBox(height: 80,),
                        // #email, #password
                        Container(

                          child: Column(
                            children: [//click on the one that most fits yoy
                              Container(
                                child: CharityInstitutionButton()
                                ,
                              ),
                              SizedBox(
                                height: 50,
                              ),
                              Container(
                                child: DonorButton(),
                              ),
                              SizedBox(
                                height: 50,
                              ),
                              Container(
                                child: LogInButton(),
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