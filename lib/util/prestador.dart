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

  Prestador._internal();
}
