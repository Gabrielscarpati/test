import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:projeto_treinamento/features/logIn_SingUp/singUpPart2WorkerInformation/ViewSingUpScreenInstitution.dart';
import 'backArrowSignUp.dart';
import 'package:email_validator/email_validator.dart';



class SignUpPart1Body extends StatefulWidget {

  const SignUpPart1Body({Key? key,

  }) : super(key: key);
  @override
  _LogInBody createState() => _LogInBody();
}
class _LogInBody extends State<SignUpPart1Body> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final formKeyAuthentication = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
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
             SizedBox(height: screenHeight*0.011848*2),

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
                        SizedBox(height: screenHeight*0.011848*6),
                        // #email, #password
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: const[
                              BoxShadow(
                                  color: Color.fromRGBO(
                                      171, 171, 171, 0.7019607843137254),blurRadius: 20,offset: Offset(0,10)),
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
                                    if (passwordController!.isEmpty || !RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$').hasMatch(passwordController)){
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
                             ],
                            ),
                          ),
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
                              onPressed: () {
                                  final form = formKeyAuthentication.currentState!;
                                  if (form.validate()) {
                                    Navigator.of(context).push(MaterialPageRoute(
                                        builder: (context) => SingUpPart2WorkerInformation()
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
                                    onPressed: () {},
                                    child: Center(
                                      child: Container(
                                        child: Row(
                                          children: <Widget>[
                                            SizedBox(
                                              child: new Image.network('https://wpaperhd.com/wp-content/uploads/2019/12/2551091659-apple-logo-JE5P-JE5P-1920x1080-MM-78.jpg',
                                                height: 30,
                                              ),
                                            ),
                                            SizedBox(width: screenWidth*0.02564,),
                                            Text('Apple',
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
                             SizedBox(width: screenWidth*0.02564*2),
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
                                  onPressed: () {},
                                  child: Center(
                                    child: Container(
                                      child: Row(
                                        children: <Widget>[
                                          SizedBox(
                                            child: new Image.network('https://logowik.com/content/uploads/images/985_google_g_icon.jpg',
                                              height: 30,
                                            ),
                                          ),
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
}

