import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:projeto_treinamento/features/hubPrestador/presenterHub.dart';
import 'package:projeto_treinamento/util/libraryComponents/popUps/popUpLogInSenhaIncorreta.dart';
import '../../../../main.dart';
import '../../../../util/funcoesLogIn/funcaoPestadorLoginEmailNaoExiste.dart';
import '../../../../util/libraryComponents/colors/colorGradient.dart';
import '../../../../daos/firebase/authService.dart';
import '../../../../util/libraryComponents/popUps/popUpEmailNaoExiste.dart';
import '../../esqueceuSenhaPrestador/esqueceuSenhaPrestador.dart';
import '../../signUpPart1PrestadorServico/views/signUpBody.dart';
import 'fazerAsFuncoesLOGINESALVAr.dart';



class LogInBodyPrestador extends StatefulWidget {
  const LogInBodyPrestador({Key? key,
  }) : super(key: key);
  @override
  _LogInBodyPrestador createState() => _LogInBodyPrestador();
}
class _LogInBodyPrestador extends State<LogInBodyPrestador> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final _formKeyAuthenticationLogIn = GlobalKey<FormState>();

  Map? _userData;
  GoogleSignInAccount? usuario;
  bool _estaEscondido = false;

  @override
  Widget build(BuildContext context) {
    return usuario == null && _userData == null ? _usuarioNaologado(context) : _usuarioLogado(context);
  }
  Widget _usuarioNaologado(BuildContext context) {
    FuncaoPestadorLogInEmailNaoExiste funcaoPestadorLogInEmailNaoExiste = FuncaoPestadorLogInEmailNaoExiste(emailController: emailController);
    double screenWidth = MediaQuery.of(context).size.width;
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

            const SizedBox(height: 14),

            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const[
                  Text("Login",style: TextStyle(color: Colors.white,fontSize: 40),),
                  SizedBox(height: 10,),
                  Text("Bem-vindo de volta",style: TextStyle(color: Colors.white,fontSize: 20),),
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
                    padding: const EdgeInsets.all(22),
                    child: Column(
                      children: [
                        const SizedBox(height: 40,),
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

                          child: Form(
                            key: _formKeyAuthenticationLogIn,
                            child: Column(
                              children: [
                                Container(
                                  padding: const EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                    border: Border(bottom: BorderSide(color: Colors.grey.shade200)),
                                  ),
                                  child: TextFormField(
                                    controller: emailController,
                                    cursorColor: Colors.indigoAccent,
                                    validator: (emailController) => !EmailValidator.validate(emailController!)
                                        ? 'Email inválido'
                                        : null,
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
                                    cursorColor: Colors.indigoAccent,
                                    obscureText: _estaEscondido,
                                    validator: (passwordController) {
                                      if (passwordController!.isEmpty || !RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9]).{8,}$').hasMatch(passwordController)){
                                        return "Sua senha deve conter uma letra maiúscula,\n minúscula e um número e pelo menos 8 caracteres";
                                      }else{
                                        return null;
                                      }
                                    },
                                    decoration: InputDecoration(
                                        suffix: InkWell(
                                            onTap: _togglePasswordView,
                                            child: Icon(
                                              _estaEscondido
                                                  ? Icons.visibility
                                                  : Icons.visibility_off,
                                            ),
                                          ),
                                        hintText: "Senha",
                                        hintStyle: TextStyle(color: Colors.grey),
                                        border: InputBorder.none
                                    ),
                                  ),
                                ),
                              ],
                            ),
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
                            child:ElevatedButton(
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


                              onPressed: () async {
                                  final formLogIn = _formKeyAuthenticationLogIn.currentState!;
                                  if (await funcaoPestadorLogInEmailNaoExiste.checkIfEmailInUse() == false){
                                    await mostrarErroEmailInvalido();
                                  } else if (formLogIn.validate()) {
                                    await AuthService().loginUser(emailController.text, passwordController.text);
                                    if(await AuthService().loginUser(emailController.text, passwordController.text)== null){
                                      print(await AuthService().loginUser(emailController.text, passwordController.text));
                                      mostrarSenhaIncorreta();
                                    }else{
                                      Navigator.of(context).push(
                                          MaterialPageRoute(builder: (context) => PresenterHubPrestador.presenter())
                                      );
                                    }
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
                        SizedBox(height: 16,),
                        GestureDetector(
                          child: Text('Esqueceu senha?',
                          style: TextStyle(
                            decoration: TextDecoration.underline,
                            color: Colors.blue[600],
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                           ),
                          ),
                          onTap: () => Navigator.of(context).push(
                              MaterialPageRoute(builder: (context) => EsqueceuSenhaPrestadorScreen())
                          ),
                        ),
                        SizedBox(height: 16,),
                        GestureDetector(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('Não tem conta?',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text('Cadastre-se',
                                style: TextStyle(
                                  decoration: TextDecoration.underline,
                                  color: Colors.blue[600],
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                          onTap: () => Navigator.of(context).push(
                              MaterialPageRoute(builder: (context) => SignUpPart1Body())
                          ),
                        ),
                        const SizedBox(height: 20),
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

                                    },
                                    child: Center(
                                      child: Container(
                                        child: Row(
                                          children: <Widget>[
                                            Icon(FontAwesomeIcons.facebook, color: Colors.indigoAccent,),

                                            SizedBox(width: screenWidth*0.01,),
                                            Text('Facebook',
                                              style: TextStyle(
                                                  fontSize: 17,
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
                                        borderRadius: new BorderRadius.circular(18.0),
                                      ),
                                    ),
                                    onPressed: () async{
                                      await signInWithGoogle();
                                      print(usuario!);
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

  void _togglePasswordView() {
    setState(() {
      _estaEscondido = !_estaEscondido;
    });
  }

  Widget _usuarioLogado(BuildContext context) {
    return PresenterHubPrestador.presenter();
  }

  Future mostrarErroEmailInvalido() => showDialog(
    context: context,
    builder: (context) => PopUpEmailNaoExiste(),
  );

  Future mostrarSenhaIncorreta() => showDialog(
    context: context,
    builder: (context) => PopUpSenhaEstaIcorreta(),
  );
}
