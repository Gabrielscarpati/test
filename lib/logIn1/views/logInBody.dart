import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'fazerAsFuncoesLOGINESALVAr.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';


class LogInBody extends StatefulWidget {
  final Client client;
//  final ViewModelLogIn viewMoldel;
  const LogInBody({Key? key,
    required this.client
  //required this.viewMoldel,
  }) : super(key: key);
  @override
  _LogInBody createState() => _LogInBody();
}
class _LogInBody extends State<LogInBody> {
  Client client = http.Client();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();


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
              child: SizedBox(child: BackArrowLogInScreen()) ),

            const SizedBox(height: 14),
            // #login, #welcome
            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const[
                  Text("Login",style: TextStyle(color: Colors.white,fontSize: 40),),
                  SizedBox(height: 10,),
                  Text("Welcome Back",style: TextStyle(color: Colors.white,fontSize: 20),),
                ],
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
                    padding: const EdgeInsets.all(30),
                    child: Column(
                      children: [
                        const SizedBox(height: 60,),
                        // #email, #password
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: const[
                              BoxShadow(
                                  color: Color.fromRGBO(171, 171, 171, .7),blurRadius: 20,offset: Offset(0,10)),
                            ],
                          ),


                          child: Column(
                            children: [
                              Container(
                                padding: const EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                  border: Border(bottom: BorderSide(color: Colors.grey.shade200)),
                                ),
                                child: TextField(
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
                                child:  TextField(
                                  controller: passwordController,
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
                         SizedBox(height: 40),
                        // #login
                        Container(
                          height: 50,
                          margin:  EdgeInsets.symmetric(horizontal: 50),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              color: Colors.green[800]
                          ),
                          child:  Center(
                            child: RaisedButton(
                              onPressed: () {
                                //widget.client.post( url, body: {'password': passwordController.text, 'email' : emailController.text});
                                Navigator.pop(context);
                              },
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(80.0)),
                              padding: EdgeInsets.all(0.0),
                              child: Ink(
                                decoration: BoxDecoration(
                                    gradient: LinearGradient(colors: [Colors.blue.shade900,Colors.blue.shade500,  Colors.blue.shade400],
                                      begin: Alignment.centerLeft,
                                      end: Alignment.centerRight,
                                    ),
                                    borderRadius: BorderRadius.circular(30.0)
                                ),
                                child: Container(
                                  constraints: BoxConstraints(maxWidth: 300.0, minHeight: 50.0),
                                  alignment: Alignment.center,
                                  child: Text(
                                    'Log in',
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
                        const SizedBox(height: 30),
                        const SizedBox(height: 30),
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
                                            SizedBox(width: 10,),
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
                            const SizedBox(width: 30),
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
                                          SizedBox(width: 10,),
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

Widget _createLoginButtonGoogle() {
  return Expanded(
    child: Container(
      color: Colors.blueAccent,
      margin: EdgeInsets.fromLTRB(1.0, 6.0, 6.0, 1.0),
      child:  ElevatedButton(
        onPressed: () {},
        child: Center(
          child: Container(
            color: Colors.blueAccent,
            child: Row(
              children: <Widget>[
                SizedBox(
                  child: new Image.network('https://logowik.com/content/uploads/images/985_google_g_icon.jpg',height: 10,
                  ),
                ),

                SizedBox(width: 10,),
                Text('Google',
                style: TextStyle(
                  fontSize: 20
                ),),
              ],
            ),
          ),
        ),
      ),
    ),
  );
}