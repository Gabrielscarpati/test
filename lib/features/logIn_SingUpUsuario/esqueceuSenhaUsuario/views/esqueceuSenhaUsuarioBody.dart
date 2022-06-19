import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:projeto_treinamento/features/hubPrestador/presenterHub.dart';
import 'package:projeto_treinamento/features/logIn_SingUpUsuario/logInUsuario/views/logInBodyUsuario.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';
import '../../../../util/funcoesLogIn/funcaoPestadorLoginEmailNaoExiste.dart';
import '../../../../util/libraryComponents/colors/colorGradient.dart';
import '../../../../daos/firebase/authService.dart';
import '../../../../util/libraryComponents/popUps/popUpEmailNaoExiste.dart';
import 'backArrowEsqueceuSenhaUsuario.dart';



class EsqueceuSenhaUsuarioBody extends StatefulWidget {
  const EsqueceuSenhaUsuarioBody({Key? key,}) : super(key: key);
  @override
  _EsqueceuSenhaUsuarioBody createState() => _EsqueceuSenhaUsuarioBody();
}
class _EsqueceuSenhaUsuarioBody extends State<EsqueceuSenhaUsuarioBody> {
  final emailController = TextEditingController();
  final formKeyAuthenticationLogIn = GlobalKey<FormState>();
  final RoundedLoadingButtonController _btnController = RoundedLoadingButtonController();

  @override
  Widget build(BuildContext context) {
    FuncaoPestadorLogInEmailNaoExiste funcaoPestadorLogInEmailNaoExiste = FuncaoPestadorLogInEmailNaoExiste(emailController: emailController);
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: BoxDecorationColorGradient(context),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(12,36,0,0),
              child: SizedBox(child: BackArrowEsqueceuSenhaUsuario())),

            const SizedBox(height: 14),
            // #login, #welcome
            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const[
                  Text("Altere a sua senha",style: TextStyle(color: Colors.white,fontSize: 32),),
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
                        Text("Digete o seu email de cadastro\npara recuperar sua senha",style: TextStyle(color: Colors.blue,fontSize: 22, fontWeight: FontWeight.bold),),
                        const SizedBox(height: 20,),

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
                            key: formKeyAuthenticationLogIn,
                            child: Column(
                              children: [
                                Container(
                                  padding: const EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                    border: Border(bottom: BorderSide(color: Colors.grey.shade200)),
                                  ),
                                  child: TextField(
                                    controller: emailController,
                                    cursorColor: Colors.indigoAccent,
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
                              ],
                            ),
                          ),
                        ),
                         SizedBox(height: 40),
                        // #login
                        Container(
                          height: 50,

                          child:  Center(
                          child: RoundedLoadingButton(
                              controller: _btnController,
                              child: Ink(
                                decoration: BoxDecoration(
                                    gradient: LinearGradient(
                                      colors: [
                                        Colors.blue.shade900,
                                        Colors.blue.shade500,
                                        Colors.blue.shade400
                                      ],
                                      begin: Alignment.centerLeft,
                                      end: Alignment.centerRight,
                                    ),
                                    borderRadius:
                                    BorderRadius.circular(30.0)),
                                child: Container(
                                  constraints: BoxConstraints(
                                      maxWidth: 350.0, minHeight: 50.0),
                                  alignment: Alignment.center,
                                  child: Text(
                                    'Salvar',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 20.0,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                              onPressed: ()async {

                                final formLogIn = formKeyAuthenticationLogIn.currentState!;
                                 if(formLogIn.validate()) {
                                   await alterarSenha();
                                  Navigator.of(context).push(
                                      MaterialPageRoute(builder: (context) => LogInBodyUsuario())
                                  );
                                }
                                _btnController.reset();

                              },
                            ),
                          ),
                        ),
                        const SizedBox(height: 30),
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

  Future<void> alterarSenha() async {
    print(emailController.text);
    await FirebaseAuth.instance.sendPasswordResetEmail(email: emailController.text);

  }
}
