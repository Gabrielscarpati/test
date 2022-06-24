import 'package:projeto_treinamento/businessModels/businessModelDadosPrestador.dart';
import 'package:projeto_treinamento/businessModels/businessModelTiposDeServico.dart';
import 'package:projeto_treinamento/providers/cidade/providerCidade.dart';
import 'package:projeto_treinamento/providers/dadosPrestador/providerDadosPrestador.dart';
import 'package:projeto_treinamento/providers/tiposDeServico/providerTiposDeServico.dart';

class TipoDeServico {
  static final TipoDeServico _singleton = TipoDeServico._internal();
  List<BusinessModelTiposDeServico> listaTodosPrestadores = [];

  factory TipoDeServico() {
    return _singleton;
  }

  Future<void> getTiposDeServico() async {
    listaTodosPrestadores = await ProviderTiposDeServico().getBusinessModels();
  }

  TipoDeServico._internal();
}
