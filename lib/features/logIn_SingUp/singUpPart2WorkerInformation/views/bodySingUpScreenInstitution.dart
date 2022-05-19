import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import '../../pesquisaCidade/views/viewPesquisaCidadeBody.dart';
import '../../signUpPart3ChooseCity/viewPesquisaCidade.dart';
import '../widgets_for_signup.dart';
import 'backArrowSingUpScreenInstitutions.dart';


class BodySingUpScreenInstitution extends StatefulWidget {

   const BodySingUpScreenInstitution({Key? key,

  }) : super(key: key);
  @override
  _BodySingUpScreenInstitution createState() => _BodySingUpScreenInstitution();
}
class _BodySingUpScreenInstitution extends State<BodySingUpScreenInstitution> {
  Client client = http.Client();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final nameController = TextEditingController();
  final addressController = TextEditingController();
  final itemsAcceptedController = TextEditingController();
  final workingHoursController = TextEditingController();
  final cityController = TextEditingController();
  final phoneController = TextEditingController();
  final  descriptionController = TextEditingController();


  final formKeyAuthentication = GlobalKey<FormState>();


  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
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
              padding: const EdgeInsets.fromLTRB(12, 34, 0, 4),
              child:
              Row(
                children: [
                  SizedBox(child:
                  BackArrowSingUpScreenInstitutions(),
                  ),
                  Text("SignUp",
                    style: TextStyle(color: Colors.white, fontSize: 32),),
                ],
              ),
            ),
            Expanded(
              child: Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(30),
                      topRight: Radius.circular(30)),
                ),
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(30, 5, 30, 0),
                    child: Column(
                      children: [
                        const Padding(
                          padding: EdgeInsets.all(15),
                          child: Center(
                            child:SizedBox(
                              height: 160,
                              width: 160,
                                child: CircleAvatar(
                                  backgroundImage: AssetImage('assets/imageLogo.jpeg'),
                                  radius: 70,
                                ),

                            ),
                          ),
                        ),
                        Form(
                          key: formKeyAuthentication,
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Column(
                              children: [
                                NameWidget(nameController: nameController),
                                PhoneWidget(phoneController: phoneController),
                                WorkingHoursWidget(workingHoursController: workingHoursController,),
                                DescriptionWidget(descriptionController: descriptionController,),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(height: screenHeight*.02),
                        // #login
                        Container(
                          height: 50,
                          margin: EdgeInsets.symmetric(horizontal: 50),

                          child: Column(
                              children: [
                                ElevatedButton(
                                  child: Ink(
                                    decoration: BoxDecoration(
                                        gradient: LinearGradient(colors: [Colors.blue.shade900,Colors.blue.shade500,  Colors.blue.shade400],
                                          begin: Alignment.centerLeft,
                                          end: Alignment.centerRight,
                                        ),
                                        borderRadius: BorderRadius.circular(30.0)
                                    ),

                                    child: Container(
                                      constraints: BoxConstraints(maxWidth: 350.0, minHeight: 50.0),
                                      alignment: Alignment.center,
                                      child: Text(
                                        'Sign Up',
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
                                    final form = formKeyAuthentication
                                        .currentState!;

                                    if (form.validate()) {
                                      Navigator.of(context).push(MaterialPageRoute(
                                          builder: (context) => ViewPesquisaCidadeBodya()                                 ));
                                    }
                                  },
                                  style: ElevatedButton.styleFrom(
                                    padding: EdgeInsets.all(0),
                                    shape: new RoundedRectangleBorder(
                                      borderRadius: new BorderRadius.circular(30.0),
                                    ),
                                  ),
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
