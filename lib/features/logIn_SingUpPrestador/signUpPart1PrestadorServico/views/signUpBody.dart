import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:url_launcher/url_launcher_string.dart';
import '../../../../util/libraryComponents/colors/colorGradient.dart';
import '../../../../daos/firebase/authService.dart';
import '../../../hub/presenterHub.dart';
import '../../../logIn_SingUpPrestador/signUpPart2WorkerInformation/ViewSignUpPart2WorkerInformatio.dart';
import 'backArrowSignUp.dart';
import 'package:email_validator/email_validator.dart';
import 'package:url_launcher/url_launcher.dart';


GoogleSignInAccount? _usuarioAtual;

class SignUpPart1Body extends StatefulWidget {

  const SignUpPart1Body({Key? key,

  }) : super(key: key);
  @override
  _LogInBody createState() => _LogInBody();
}
class _LogInBody extends State<SignUpPart1Body> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final cofirmPasswordController = TextEditingController();
  final formKeyAuthentication = GlobalKey<FormState>();

  bool? _isChecked = false;
  Map? _userData;
  GoogleSignInAccount? usuario = _usuarioAtual;


  @override
  Widget build(BuildContext context) {
    return usuario == null && _userData == null ? _usuarioNaologado(context) : _usuarioLogado(context);
  }
  Widget _usuarioNaologado(BuildContext context) {

    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: BoxDecorationColorGradient(context),

        child: Column(

          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(12,36,0,0),
              child: SizedBox(child: BackArrowLogInScreen()) ),

             SizedBox(height: screenHeight*0.011848),
            // #login, #welcome
            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Sign Up",style: TextStyle(color: Colors.white,fontSize: 40),),
                  SizedBox(height: screenHeight*0.011848),
                  Text("Welcome Back",style: TextStyle(color: Colors.white,fontSize: 20),),
                ],
              ),
            ),
             SizedBox(height: screenHeight*0.011848),

            Expanded(
              child: Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(60),topRight: Radius.circular(60)),
                ),
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(30),
                    child: Column(
                      children: [
                        SizedBox(height: screenHeight*0.011848*2),
                        // #email, #password
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: const[
                              BoxShadow(
                                  color: Color.fromRGBO(171, 171, 171, 0.7019607843137254),blurRadius: 20,offset: Offset(0,10)),
                            ],
                          ),

                          child: Form(
                            key: formKeyAuthentication,
                            child: Column(
                            children: [
                              Container(
                                padding: const EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                  border: Border(bottom: BorderSide(color: Colors.grey.shade200)),
                                ),
                                child: TextFormField(
                                  validator: (emailController) => !EmailValidator.validate(emailController!)
                                      ? 'Enter a valid email'
                                      : null,
                                  controller: emailController,
                                  decoration: InputDecoration(
                                    suffixIcon: IconButton(
                                      icon: Icon(Icons.close),
                                      onPressed: () => emailController.clear(),
                                    ),
                                      hintText: "Email",
                                      hintStyle: TextStyle(color: Colors.grey),
                                      border: InputBorder.none
                                  ),
                                  keyboardType: TextInputType.emailAddress,
                                ),
                              ),

                              Container(
                                padding: const EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                  border: Border(bottom: BorderSide(color: Colors.grey.shade200)),
                                ),
                                child: TextFormField(
                                  controller: passwordController,
                                  validator: (passwordController) {
                                    if (passwordController!.isEmpty || !RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9]).{8,}$').hasMatch(passwordController)){
                                      return "Your password should contain Lower and upper\n case letters and a special symbol";
                                    }else{
                                      return null;
                                    }
                                  },
                                  decoration: InputDecoration(
                                      suffixIcon: IconButton(
                                        icon: Icon(Icons.close),
                                        onPressed: () => passwordController.clear(),
                                      ),
                                      hintText: "Password",
                                      hintStyle: TextStyle(color: Colors.grey),
                                      border: InputBorder.none
                                   ),
                                 ),
                               ),
                              Container(
                                padding: const EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                  border: Border(bottom: BorderSide(color: Colors.grey.shade200)),
                                ),
                                child: TextFormField(
                                  validator: (cofirmPasswordController) => passwordController.text != cofirmPasswordController.toString()
                                      ? 'The password must be the same'
                                      : null,
                                  controller: cofirmPasswordController,
                                  decoration: InputDecoration(
                                      suffixIcon: IconButton(
                                        icon: Icon(Icons.close),
                                        onPressed: () => cofirmPasswordController.clear(),
                                      ),
                                      hintText: "Confirm Password",
                                      hintStyle: TextStyle(color: Colors.grey),
                                      border: InputBorder.none
                                  ),
                                ),
                              ),
                             ],
                            ),
                          ),
                        ),
                        CheckboxListTile(
                            value: _isChecked,
                            onChanged: (bool? novoValor){

                              setState(() {
                                _isChecked = true;
                              });
                            },
                            title: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('  Li e concordo com a',
                                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                                ),
                                 TextButton(onPressed: () async {
                                   await  _launchURLPoliticasDeprivacidade;
                                  },
                                      child: Text('Politica de privacidade',
                                        style: TextStyle(fontWeight: FontWeight.bold,
                                            color: Colors.indigoAccent,
                                            fontSize: 14),
                                      ),
                                 ),
                              ],
                            ),
                          //shape: ro,
                          checkColor: Colors.indigo,
                           ),
                         SizedBox(height: screenHeight*0.011848*4),
                        // #login
                        Container(
                          height: screenHeight*0.011848*5,
                          margin:  EdgeInsets.symmetric(horizontal: 50),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),

                          ),
                          child:  Center(
                            child: ElevatedButton(
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
                              onPressed: () async {
                                final form = formKeyAuthentication.currentState!;
                                  if (form.validate() && _isChecked == true) {
                                    await AuthService().registerUser(emailController.text, passwordController.text);

                                      Navigator.of(context).push(
                                          MaterialPageRoute(
                                              builder: (context) =>SingUpPart2WorkerInformation()
                                          ));
                                  }
                              },
                              style: ElevatedButton.styleFrom(
                                padding: EdgeInsets.all(0),
                                shape: new RoundedRectangleBorder(
                                  borderRadius: new BorderRadius.circular(30.0),
                                ),
                              ),
                            ),
                          ),
                        ),
                         SizedBox(height: screenHeight*0.011848*4),
                        Row(
                          children: [
                            Expanded(
                                child: SizedBox(
                                  height: 50,
                                  child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      primary: Colors.white, //[Colors.blue.shade900,Colors.blue.shade500,  Colors.blue.shade400]
                                      shape: new RoundedRectangleBorder(
                                        borderRadius: new BorderRadius.circular(20.0),
                                      ),
                                    ),
                                    onPressed: ()  async {
                                      await signInWithFacebook();
                                      print('-'*50);

                                    },
                                    child: Center(
                                      child: Container(
                                        child: Row(
                                          children: <Widget>[
                                            Icon(FontAwesomeIcons.facebook, color: Colors.indigoAccent,),

                                            SizedBox(width: screenWidth*0.015,),
                                            Text('Facebook',
                                              style: TextStyle(
                                                  fontSize: 20,
                                                  color: Colors.black
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                )
                            ),
                            SizedBox(width: screenWidth*0.02564*.7),
                            Expanded(
                                child: SizedBox(
                                  height: 50,
                                  child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      primary: Colors.white, //[Colors.blue.shade900,Colors.blue.shade500,  Colors.blue.shade400]
                                      shape: new RoundedRectangleBorder(
                                        borderRadius: new BorderRadius.circular(20.0),
                                      ),
                                    ),
                                    onPressed: () {
                                      signInWithGoogle();
                                      setState(() {

                                      });
                                    },

                                    child: Center(
                                      child: Container(
                                        child: Row(
                                          children: <Widget>[
                                            Icon(FontAwesomeIcons.google, color: Colors.indigoAccent,),


                                            SizedBox(width: screenWidth*0.02564,),
                                            Text('Google',
                                              style: TextStyle(
                                                  fontSize: 20,
                                                  color: Colors.black
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                )
                            ),
                          ],
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


  Future<UserCredential> signInWithFacebook() async {

    final LoginResult result = await FacebookAuth.instance.login(permissions:['email']);


    if (result.status == LoginStatus.success) {

      final userData = await FacebookAuth.instance.getUserData();

      _userData = userData;
    } else {
      print(result.message);
    }

    setState(() {
      String haha = '';
      haha = _userData?['email'];
    });


    final OAuthCredential facebookAuthCredential = FacebookAuthProvider.credential(result.accessToken!.token);

    return FirebaseAuth.instance.signInWithCredential(facebookAuthCredential);
  }

  Future<UserCredential> signInWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication googleAuth = await googleUser!.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );
    var userEmail = '';

    userEmail = googleUser.email;

    // Once signed in, return the UserCredential
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }

  void _launchURLPoliticasDeprivacidade() async {
    const url = 'https://linktr.ee/Lifecoin_WhitePapers';
    if (await canLaunchUrlString(url)) {
      await launchUrlString(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  Widget _usuarioLogado(BuildContext context) {
    return PresenterHub.presenter();
  }
}

