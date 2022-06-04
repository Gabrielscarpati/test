import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

import 'package:projeto_treinamento/features/infoPrestadorDeServico/viewModelInfoPrestadorDeServico.dart';
import 'package:projeto_treinamento/features/infoUsuario/presenterInfoUsuario.dart';
import 'package:projeto_treinamento/features/infoUsuario/views/customEditPrestadorInformation.dart';
import 'package:projeto_treinamento/features/perfilPrestadorDeServico/presenterPerfilPrestadorDeServico.dart';
import 'package:projeto_treinamento/features/perfilPrestadorDeServico/viewModelPerfilPrestadorDeServico.dart';

import 'package:provider/provider.dart';


import 'daos/firebase/authService.dart';
import 'daos/prestadorInformation/daoPrestadorInformatio.dart';
import 'daos/usuario/daoUsuario.dart';
import 'features/hub/presenterHub.dart';
import 'features/infoPrestadorDeServico/views/comentariosInfoPrestadorDeServico.dart';
import 'features/logIn_SingUpPrestador/selectCidades/presenterSelectCidade.dart';
import 'features/logIn_SingUpPrestador/signUpEplicandoTelaDocumentos/viewSignUpEplicandoTelaDocumentos.dart';
import 'features/logIn_SingUpPrestador/signUpPart1PrestadorServico/signUpPart1Prestador.dart';
import 'features/logIn_SingUpPrestador/signUpPart2WorkerInformation/ViewSignUpPart2WorkerInformatio.dart';
import 'features/logIn_SingUpPrestador/singUpPart5PrestadorDocumentos/signUpPart5PrestadorDocumentos.dart';
import 'features/logIn_SingUpPrestador/veryFirstScreen/veryFirstScreenUserType.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}


GoogleSignInAccount? _usuarioAtual;


Future<String> verificarSeUsuarioNulo() async{
  final userData = await FacebookAuth.instance.getUserData();
  return userData.toString();
}



class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    GoogleSignInAccount? usuario = _usuarioAtual;
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: MaterialColor(
          0xffF0F0F0,
          <int, Color>{
            50: Color(0xFFE1F5FE),
            100: Color(0xFFB3E5FC),
            200: Color(0xFF81D4FA),
            300: Color(0xFF4FC3F7),
            400: Color(0xFF29B6F6),
            500: Color(0xffF0F0F0),
            600: Color(0xFF039BE5),
            700: Color(0xFF0288D1),
            800: Color(0xFF0277BD),
            900: Color(0xFF01579B),
          },
        ),
        brightness: Brightness.light,
        elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
          primary: Color(0xffF0F0F0), //change background color of button
          onPrimary: Theme.of(context)
              .textTheme
              .headline4!
              .color, //change text color of button
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        )),
      ),
      home: StreamBuilder(
          stream: AuthService().firebaseAuth.authStateChanges(),
          builder: (context, AsyncSnapshot snapshot) {
            if (snapshot.hasData || usuario!= null || verificarSeUsuarioNulo() != null) {
              print(snapshot.hasData);

              return ComentariosInfoPrestadorDeServico();
            }
            return ViewVeryFirstScreen();

          }),
      //SingUpPart2WorkerInformation(),
      //SignUpPart1(),
      //ViewPesquisaCidadeBodya(),
      //ViewSignUpPart3ChooseCity()
      //ViewVeryFirstScreen()
      //PresenterHub.presenter()
      //PresenterHub.presenter()
      //ViewVeryFirstScreen()
    );
  }
}
