import 'package:projeto_treinamento/daos/prestadorInformation/dataModePrestadorInformation.dart';
import 'package:projeto_treinamento/framework/provider.dart';

import 'package:projeto_treinamento/framework/providerDireto.dart';
import 'package:projeto_treinamento/providers/prestadorInformation/adapterPrestadorInformation.dart';
import 'package:projeto_treinamento/util/resposta_processamento.dart';

import '../../businessModels/businessModelPrestadorInfomation.dart';
import '../../daos/prestadorInformation/daoPrestadorInformatio.dart';

class ProviderPrestadorInformation
    extends Provider<BusinessModelPrestadorInformation> {
  @override
  Future<BusinessModelPrestadorInformation> getBusinessModel(String id) async {
    // TODO: implement getBusinessModel
    throw UnimplementedError();
  }

  @override
  Future<List<BusinessModelPrestadorInformation>> getBusinessModels() async {
    // TODO: implement getBusinessModels
    throw UnimplementedError();
  }

  @override
  Future<RespostaProcessamento> removeBusinessModel(businessModel) async {
    // TODO: implement removeBusinessModel
    throw UnimplementedError();
  }

  @override
  Future<RespostaProcessamento> saveBusinessModel(businessModel) async {
    // TODO: implement saveBusinessModel
    throw UnimplementedError();
  }
}
