import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:projeto_treinamento/features/hubPrestador/presenterHub.dart';
import 'package:projeto_treinamento/features/hubUsuario/presenterHub.dart';
import 'package:projeto_treinamento/features/logIn_SingUpPrestador/signUpPart1PrestadorServico/views/googleSignUp.dart';
import 'package:projeto_treinamento/features/logIn_SingUpUsuario/logInUsuario/logInUsuaioScreen.dart';
import 'package:projeto_treinamento/util/libraryComponents/colors/colors.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';
import 'package:url_launcher/url_launcher_string.dart';
import '../../../../util/funcoesLogIn/funcaoPestadorEmailJaExisteOuNao.dart';
import '../../../../util/getTermos.dart';
import '../../../../util/libraryComponents/colors/colorGradient.dart';
import '../../../../daos/firebase/authService.dart';
import '../../../../util/libraryComponents/popUps/popUpAceiteAsPoliticasDePrivacidade.dart';
import '../../../../util/libraryComponents/popUps/popUpEmailJaEstaEmUso.dart';
import 'backArrowSignUp.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';

GoogleSignInAccount? _usuarioAtualGoogle;

class SignUpUsuarioBody extends StatefulWidget {
  const SignUpUsuarioBody({
    Key? key,
  }) : super(key: key);
  @override
  _SignUpUsuarioBody createState() => _SignUpUsuarioBody();
}

class _SignUpUsuarioBody extends State<SignUpUsuarioBody> {
  Map? _userDataFacebook;
  bool _estaEscondidoSenha = false;
  bool _estaEscondidoConfirmarSenha = false;

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final cofirmPasswordController = TextEditingController();
  final formKeyAuthentication = GlobalKey<FormState>();

  bool? _isChecked = false;

  final RoundedLoadingButtonController _btnController =
      RoundedLoadingButtonController();

  GoogleSignInAccount? usuarioGoogle = _usuarioAtualGoogle;

  @override
  Widget build(BuildContext context) {
    return usuarioGoogle == null && _userDataFacebook == null
        ? _usuarioNaologado(context)
        : _usuarioLogado(context);
  }

  Widget _usuarioNaologado(BuildContext context) {
    FuncaoPestadorEmailJaExisteOuNao funcaoPestadorEmailJaExisteOuNao =
        FuncaoPestadorEmailJaExisteOuNao(emailController: emailController);
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
                padding: const EdgeInsets.fromLTRB(12, 36, 0, 0),
                child: SizedBox(child: BackArrowLogInScreen())),

            SizedBox(height: screenHeight * 0.011848),
            // #login, #welcome
            Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Cadastre-se",
                    style: TextStyle(color: Colors.white, fontSize: 40),
                  ),
                  SizedBox(height: screenHeight * 0.011848),
                  Text(
                    "Seja bem vindo ao Quick Fix",
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                ],
              ),
            ),
            SizedBox(height: screenHeight * 0.011848),

            Expanded(
              child: Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(60),
                      topRight: Radius.circular(60)),
                ),
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.only(
                        top: 30, bottom: 30, right: 20, left: 20),
                    child: Column(
                      children: [
                        SizedBox(height: screenHeight * 0.011848 * 2),
                        // #email, #password
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: const [
                              BoxShadow(
                                  color: Color.fromRGBO(
                                      171, 171, 171, 0.7019607843137254),
                                  blurRadius: 20,
                                  offset: Offset(0, 10)),
                            ],
                          ),
                          child: Form(
                            key: formKeyAuthentication,
                            child: Column(
                              children: [
                                Container(
                                  padding: const EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                    border: Border(
                                        bottom: BorderSide(
                                            color: Colors.grey.shade200)),
                                  ),
                                  child: TextFormField(

                                    validator: (emailController) =>
                                        !EmailValidator.validate(
                                                emailController!)
                                            ? 'Email inválido'
                                            : null,
                                    controller: emailController,
                                    cursorColor: CursorColor,
                                    decoration: InputDecoration(
                                        suffixIcon: IconButton(
                                          icon: Icon(Icons.close),
                                          onPressed: () =>
                                              emailController.clear(),
                                        ),
                                        hintText: "Email",
                                        hintStyle:
                                            TextStyle(color: Colors.grey),
                                        border: InputBorder.none),
                                    keyboardType: TextInputType.emailAddress,
                                  ),
                                ),
                                Container(
                                  padding: const EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                    border: Border(
                                        bottom: BorderSide(
                                            color: Colors.grey.shade200)),
                                  ),
                                  child: TextFormField(
                                    controller: passwordController,
                                    cursorColor: CursorColor,
                                    obscureText: _estaEscondidoSenha,
                                    validator: (passwordController) {
                                      if (passwordController!.isEmpty ||
                                          !RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9]).{8,}$')
                                              .hasMatch(passwordController)) {
                                        return "Sua senha deve conter uma letra maiúscula,\n minúscula e um número e pelo menos 8 caracteres";
                                      } else {
                                        return null;
                                      }
                                    },
                                    decoration: InputDecoration(
                                        suffix: InkWell(
                                          onTap: _togglePasswordViewSenha,
                                          child: Icon(
                                            _estaEscondidoSenha
                                                ? Icons.visibility
                                                : Icons.visibility_off,
                                          ),
                                        ),
                                        hintText: "Senha",
                                        hintStyle:
                                            TextStyle(color: Colors.grey),
                                        border: InputBorder.none),
                                  ),
                                ),
                                Container(
                                  padding: const EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                    border: Border(
                                        bottom: BorderSide(
                                            color: Colors.grey.shade200)),
                                  ),
                                  child: TextFormField(
                                    validator: (cofirmPasswordController) =>
                                        passwordController.text !=
                                                cofirmPasswordController
                                                    .toString()
                                            ? 'As senhas precisam ser iguais'
                                            : null,
                                    controller: cofirmPasswordController,
                                    cursorColor: CursorColor,
                                    obscureText: _estaEscondidoConfirmarSenha,
                                    decoration: InputDecoration(
                                        suffix: InkWell(
                                          onTap:
                                              _togglePasswordViewConfirmarSenha,
                                          child: Icon(
                                            _estaEscondidoConfirmarSenha
                                                ? Icons.visibility
                                                : Icons.visibility_off,
                                          ),
                                        ),
                                        hintText: "Confirme senha",
                                        hintStyle:
                                            TextStyle(color: Colors.grey),
                                        border: InputBorder.none),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        CheckboxListTile(
                          value: _isChecked,
                          onChanged: (bool? novoValor) {
                            setState(() {
                              _isChecked = !_isChecked!;
                            });
                          },
                          title: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              GestureDetector(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Li e concordo com as',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold, fontSize: 14),
                                      ),
                                      Text(
                                        'Políticas de privacidade',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: Colors.indigoAccent,
                                            fontSize: 14),
                                      ),
                                    ],
                                  ),
                                  onTap: () async{
                                    await _launchURLPoliticasDeprivacidade();

                                  }
                              ),
                            ],
                          ),
                          //shape: ro,
                          checkColor: Colors.indigo,
                        ),
                        SizedBox(height: screenHeight * 0.011848 * 2),
                        // #login
                        Container(
                          height: screenHeight * 0.011848 * 5,
                          margin: EdgeInsets.symmetric(horizontal: 50),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                          ),
                          child: Center(
                            child: RoundedLoadingButton(
                              controller: _btnController,
                              child: Ink(
                                decoration: BoxDecorationColorGradientButton(context),
                                child: Container(
                                  constraints: BoxConstraints(
                                      maxWidth: 350.0, minHeight: 50.0),
                                  alignment: Alignment.center,
                                  child: Text(
                                    'Cadastre-se',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 20.0,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                              onPressed: () async {
                                final form =
                                    formKeyAuthentication.currentState!;
                                if(_isChecked == false) {
                                  aceiteAsPoliticasDePrivacidade();
                                }
                                else if (await funcaoPestadorEmailJaExisteOuNao
                                        .checkIfEmailInUse() ==
                                    true) {
                                  await mostrarErroEmailInvalido();
                                } else if (form.validate() &&
                                    _isChecked == true) {
                                  await AuthService().registerUser(
                                      emailController.text,
                                      passwordController.text);
                                  await usuarios.doc(await getUserId()).set({
                                    'email': emailController.text.trim(),
                                    'senha': passwordController.text.trim(),
                                  });
                                  Navigator.pushAndRemoveUntil(context,
                                    MaterialPageRoute(builder: (BuildContext context) {
                                      return PresenterHubUsuario.presenter();
                                    },
                                    ),
                                        (route)=> false,);
                                }
                                _btnController.reset();
                              },
                            ),
                          ),
                        ),
                        SizedBox(height: screenHeight * 0.011848 * 2),

                        GestureDetector(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Já tem conta?',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                'Entrar',
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
                              MaterialPageRoute(
                                  builder: (context) => LogInUsuaioScreen())),
                        ),
                        SizedBox(height: screenHeight * 0.011848 * 2),
                        Row(
                          children: [
                            Expanded(
                                child: SizedBox(
                              height: 50,
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  primary: Colors
                                      .white, //[Colors.blue.shade900,Colors.blue.shade500,  Colors.blue.shade400]
                                  shape: new RoundedRectangleBorder(
                                    borderRadius:
                                        new BorderRadius.circular(20.0),
                                  ),
                                ),
                                onPressed: () async {
                                  await signInWithFacebook();

                                },
                                child: Center(
                                  child: Container(
                                    child: Row(
                                      children: <Widget>[
                                        Icon(
                                          FontAwesomeIcons.facebook,
                                          color: Colors.indigoAccent,
                                        ),
                                        SizedBox(
                                          width: screenWidth * 0.03,
                                        ),
                                        Text(
                                          'Cadrastre-se com Facebook',
                                          style: TextStyle(
                                              fontSize: screenWidth < 348 ?15.5 :18,
                                              color: Colors.black),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            )),
                            SizedBox(width: screenWidth * 0.02564 * .7),
                        /*    Expanded(
                                child: SizedBox(
                              height: 50,
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  primary: Colors
                                      .white, //[Colors.blue.shade900,Colors.blue.shade500,  Colors.blue.shade400]
                                  shape: new RoundedRectangleBorder(
                                    borderRadius:
                                        new BorderRadius.circular(20.0),
                                  ),
                                ),
                                onPressed: () {
                                  signInWithGoogle();
                                  setState(() {});
                                },
                                child: Center(
                                  child: Container(
                                    child: Row(
                                      children: <Widget>[
                                        Icon(
                                          FontAwesomeIcons.google,
                                          color: Colors.indigoAccent,
                                        ),
                                        SizedBox(
                                          width: screenWidth * 0.02564,
                                        ),
                                        Text(
                                          'Google',
                                          style: TextStyle(
                                              fontSize: 18,
                                              color: Colors.black),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            )),*/
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

    final LoginResult loginResult = await FacebookAuth.instance.login(
        permissions: [
          'email', 'public_profile', 'user_birthday'
        ]
    );

    final OAuthCredential facebookAuthCredential = FacebookAuthProvider.credential(loginResult.accessToken!.token);
    return FirebaseAuth.instance.signInWithCredential(facebookAuthCredential);
  }


  Future<UserCredential> signInWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication googleAuth =
        await googleUser!.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    // Once signed in, return the UserCredential
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }
  Future<String> _launchURLPoliticasDeprivacidade() async {
    GetTermos getTermos = GetTermos();

    var url = await getTermos.getTermos();
    if (await canLaunchUrlString(url)) {
      await launchUrlString(url);
    } else {
      throw 'Could not launch $url';
    }
    return 'termos';
  }

  void _togglePasswordViewSenha() {
    setState(() {
      _estaEscondidoSenha = !_estaEscondidoSenha;
    });
  }

  void _togglePasswordViewConfirmarSenha() {
    setState(() {
      _estaEscondidoConfirmarSenha = !_estaEscondidoConfirmarSenha;
    });
  }

  Widget _usuarioLogado(BuildContext context) {
    return PresenterHubUsuario.presenter();
  }

  CollectionReference usuarios =
      FirebaseFirestore.instance.collection('usuarios');

  final FirebaseAuth auth = FirebaseAuth.instance;
  Future<String?> getUserId() async {
    final User? user = await auth.currentUser;
    final userId = user?.uid.toString();
    return userId;
  }

  Future mostrarErroEmailInvalido() => showDialog(
        context: context,
        builder: (context) => PopUpEmailJaEstaEmUso(),
      );

  Future aceiteAsPoliticasDePrivacidade() => showDialog(
    context: context,
    builder: (context) => PopUpAceiteAsPoliticasDePrivacidade(),
  );
}
