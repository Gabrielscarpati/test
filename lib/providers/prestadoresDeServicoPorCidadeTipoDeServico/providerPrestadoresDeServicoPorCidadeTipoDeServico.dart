import 'package:projeto_treinamento/businessModels/businessModelPrestadoresDeServicoPorCidadeTipoDeServico.dart';
import 'package:projeto_treinamento/daos/prestadoresDeServicoPorCidadeTipoDeServico/daoPrestadoresDeServicoPorCidadeTipoDeServico.dart';
import 'package:projeto_treinamento/daos/prestadoresDeServicoPorCidadeTipoDeServico/dataModelPrestadoresDeServicoPorCidadeTipoDeServico.dart';
import 'package:projeto_treinamento/framework/providerDireto.dart';
import 'package:projeto_treinamento/util/resposta_processamento.dart';

import '../../framework/provider.dart';
import 'adapterPrestadoresDeServicoPorCidadeTipoDeServico.dart';

class ProviderPrestadoresDeServicoPorCidadeTipoDeServico extends Provider<BusinessModelPrestadoresDeServicoPorCidadeTipoDeServico> {

  

  @override
  Future<BusinessModelPrestadoresDeServicoPorCidadeTipoDeServico> getBusinessModel(String id) async{
    BusinessModelPrestadoresDeServicoPorCidadeTipoDeServico retornoBusinemodel = BusinessModelPrestadoresDeServicoPorCidadeTipoDeServico.vazio();
    return retornoBusinemodel;
  }

  @override
  Future<List<BusinessModelPrestadoresDeServicoPorCidadeTipoDeServico>> getBusinessModels() {
    // TODO: implement getBusinessModels
    throw UnimplementedError();
  }

  @override
  Future<RespostaProcessamento> removeBusinessModel(BusinessModelPrestadoresDeServicoPorCidadeTipoDeServico businessModel) {
    // TODO: implement removeBusinessModel
    throw UnimplementedError();
  }

  @override
  Future<RespostaProcessamento> saveBusinessModel(BusinessModelPrestadoresDeServicoPorCidadeTipoDeServico businessModel) {
    // TODO: implement saveBusinessModel
    throw UnimplementedError();
  }
  
}
