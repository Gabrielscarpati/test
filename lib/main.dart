import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:get_it/get_it.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:projeto_treinamento/features/hubPrestador/presenterHub.dart';
import 'package:projeto_treinamento/features/infoPrestadorDeServico/viewModelInfoPrestadorDeServico.dart';
import 'package:projeto_treinamento/features/logIn_SingUpPrestador/singUpPart5PrestadorDocumentos/views/bodySignUpPart5PrestadorDocumentos.dart';
import 'package:projeto_treinamento/features/perfilPrestadorDeServico/presenterPerfilPrestadorDeServico.dart';
import 'package:projeto_treinamento/features/perfilPrestadorDeServico/viewModelPerfilPrestadorDeServico.dart';
import 'package:projeto_treinamento/providers/cidade/providerCidade.dart';
import 'package:projeto_treinamento/teste.dart';
import 'package:projeto_treinamento/util/cidade.dart';
import 'package:projeto_treinamento/util/getPrestadoresDeServicoPorCidadeTipoDeServico.dart';
import 'package:projeto_treinamento/util/getQtdePrestadoresDeServicoPorTipoSeervicoECidade.dart';
import 'package:projeto_treinamento/features/hubPrestador/views/hubPrestadorDadosPrestador.dart';
import 'package:projeto_treinamento/util/libraryComponents/circularProgressIndicatorPersonalizado.dart';
import 'package:projeto_treinamento/util/prestador.dart';
import 'package:projeto_treinamento/util/tipoDeServico.dart';
import 'appVerifyIdentity/features/listaPrestadoresDeServico/presenterListaVerifyIdentity.dart';
import 'businessModels/businessModelDadosPrestador.dart';
import 'daos/firebase/authService.dart';
import 'daos/firebase/updatePrestadorFirebase.dart';
import 'features/hubUsuario/presenterHub.dart';
import 'features/infoPrestadorDeServico/views/comentariosInfoPrestadorDeServico.dart';
import 'features/logIn_SingUpPrestador/selectCidades/presenterSelectCidade.dart';
import 'features/logIn_SingUpPrestador/selectCidades/viewSelectCidade.dart';
import 'features/logIn_SingUpPrestador/signUpEplicandoTelaDocumentos/viewSignUpEplicandoTelaDocumentos.dart';
import 'features/logIn_SingUpPrestador/signUpPart1PrestadorServico/signUpPart1Prestador.dart';
import 'features/logIn_SingUpPrestador/signUpPart2WorkerInformation/ViewSignUpPart2WorkerInformatio.dart';
import 'features/logIn_SingUpPrestador/signUpPart2WorkerInformation/views/bodySignUpPart2WorkerInformation.dart';
import 'features/logIn_SingUpPrestador/signUpVerificacaoNumeroCelular/views/signUpVerificacaoNumeroCelularBody.dart';
import 'features/logIn_SingUpPrestador/singUpPart5PrestadorDocumentos/signUpPart5PrestadorDocumentos.dart';
import 'features/logIn_SingUpPrestador/veryFirstScreen/veryFirstScreenUserType.dart';

final navigatorKey = GlobalKey<NavigatorState>();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  final getIt = GetIt.instance;
  await Cidades().getCidades();
  await Prestador().getPrestadores();
  await TipoDeServico().getTiposDeServico();

  getIt.registerLazySingleton(() => SetPrestadorInformationCompleta(
      name: '',
      phone: '',
      workingHours: '',
      description: '',
      profilePicture: '',
      comentarios: [],
      cidades: [],
      servicos: [],
      numeroDeCliquesNoLigarOuWhatsApp: 0,
      dataVencimentoPlano: DateTime.now(),
      dataAberturaConta: DateTime.now(),
      brazilianIDPicture: '',
      planoPrestador: 0));

  runApp(MyApp());
}

GoogleSignInAccount? _usuarioAtual;

FacebookAuth? _facebookAuthUsuarioAtual;

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
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
            if (snapshot.hasData ||
                _facebookAuthUsuarioAtual?.getUserData() != null) {
              return ViewSelecionaHub();
            }
            return ViewVeryFirstScreen();
          }),
      //SingUpPart2WorkerInformation(),
      //SignUpPart1(),
      //ViewPesquisaCidadeBodya(),=
      //ViewSignUpPart3ChooseCity()
      //ViewVeryFirstScreen()
      //PresenterHub.presenter()
      //PresenterHub.presenter()
      //ViewVeryFirstScreen()
    );
  }
}

class ViewSelecionaHub extends StatefulWidget {
  const ViewSelecionaHub({Key? key}) : super(key: key);
  @override
  _ViewSelecionaHubState createState() => _ViewSelecionaHubState();
}

class _ViewSelecionaHubState extends State<ViewSelecionaHub> {
  Future<String> getPrestador() async {
    BusinessModelDadosPrestador _prestador =
        await Prestador().getPrestadorLogado();
    return _prestador.workingHours;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: FutureBuilder(
        future: getPrestador(),
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          if (snapshot.hasData) {
            if (snapshot.data == 'workingHours') {
              return PresenterHubUsuario.presenter();
            } else {
              return PresenterHubPrestador.presenter();
            }
          } else {
            return CircularProgressIndicatorPersonalizado();
          }
        },
      ),
    );
  }
}
