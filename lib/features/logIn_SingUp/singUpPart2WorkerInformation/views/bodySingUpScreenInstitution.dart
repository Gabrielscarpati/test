import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import '../../../hub/presenterHub.dart';
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


  final formKeyAuthentication = GlobalKey<FormState>();


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
                                 SizedBox(height: 3,),
                                EmailWidget(emailController: emailController,),
                                SizedBox(height: 3,),
                                PasswordWidget(passwordController: passwordController,),
                                SizedBox(height: 3,),
                                PhoneWidget(phoneController: phoneController),
                                SizedBox(height: 3,),
                                AddressWidget(addressController: addressController,),
                                SizedBox(height: 3,),
                                ItemsAcceptedWidget(itemsAcceptedController: itemsAcceptedController,),
                                SizedBox(height: 3,),
                                WorkingHoursWidget(workingHoursController: workingHoursController,),
                                SizedBox(height: 3,),
                                CityWidget(cityController: cityController,),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(height: 40),
                        // #login
                        Container(
                          height: 50,
                          margin: EdgeInsets.symmetric(horizontal: 50),

                          child: Center(
                            child: RaisedButton(
                              onPressed: () {
                                final form = formKeyAuthentication
                                    .currentState!;

                                if (form.validate()) {
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) =>
                                          PresenterHub.presenter()                                  ));
                                }
                              },
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(80.0)),
                              padding: EdgeInsets.all(0.0),
                              child: Ink(
                                decoration: BoxDecoration(
                                    gradient: LinearGradient(colors: [
                                      Colors.blue.shade900,
                                      Colors.blue.shade500,
                                      Colors.blue.shade400
                                    ],
                                      begin: Alignment.centerLeft,
                                      end: Alignment.centerRight,
                                    ),
                                    borderRadius: BorderRadius.circular(30.0)
                                ),
                                child: Container(
                                  constraints: BoxConstraints(
                                      maxWidth: 300.0, minHeight: 50.0),
                                  alignment: Alignment.center,
                                  child: Text(
                                    'Sing Up',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 20.0,
                                        fontWeight: FontWeight.bold
                                    ),
                                  ),
                                ),
                              ),
                            ),
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

