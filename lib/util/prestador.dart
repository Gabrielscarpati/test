import 'package:firebase_auth/firebase_auth.dart';
import 'package:projeto_treinamento/businessModels/businessModelDadosPrestador.dart';
import 'package:projeto_treinamento/providers/cidade/providerCidade.dart';
import 'package:projeto_treinamento/providers/dadosPrestador/providerDadosPrestador.dart';

class Prestador {
  static final Prestador _singleton = Prestador._internal();
  List<BusinessModelDadosPrestador> listaTodosPrestadores = [];

  factory Prestador() {
    return _singleton;
  }

  Future<void> getPrestadores() async {
    listaTodosPrestadores = await ProvideDadosPrestador().getBusinessModels();
  }

  Future<BusinessModelDadosPrestador> getPrestadorLogado() async {
    final FirebaseAuth auth = FirebaseAuth.instance;
    Future<String?> getUserId() async {
      final User? user = await auth.currentUser;
      final userId = user?.uid.toString();
      return userId;
    }

    BusinessModelDadosPrestador prestadorRetorno = BusinessModelDadosPrestador(
        name: 'name',
        phone: 'phone',
        workingHours: 'workingHours',
        description: 'description',
        profilePicture: 'profilePicture',
        city: ['colatina - ES'],
        roles: [1, 2],
        numeroDeCliquesNoLigarOuWhatsApp: 0,
        dataVencimentoPlano: DateTime.now(),
        dataAberturaConta: DateTime.now(),
        IdPrestador: 'IdPrestador',
        tipoPlanoPrestador: 10);
    ;

    String? userId = await getUserId();
    if (userId != null) {
      listaTodosPrestadores.forEach((element) {
        if (element.IdPrestador == userId) {
          prestadorRetorno = element;
        }
      });
    }

    return prestadorRetorno;
  }

  Prestador._internal();
}
