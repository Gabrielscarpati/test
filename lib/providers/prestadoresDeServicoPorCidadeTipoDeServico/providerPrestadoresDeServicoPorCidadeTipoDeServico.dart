import 'package:projeto_treinamento/businessModels/businessModelCidade.dart';
import 'package:projeto_treinamento/businessModels/businessModelDadosPrestador.dart';
import 'package:projeto_treinamento/businessModels/businessModelPrestadorDeServicos.dart';
import 'package:projeto_treinamento/businessModels/businessModelPrestadoresDeServicoPorCidadeTipoDeServico.dart';
import 'package:projeto_treinamento/businessModels/businessModelTiposDeServico.dart';
import 'package:projeto_treinamento/daos/prestadoresDeServicoPorCidadeTipoDeServico/daoPrestadoresDeServicoPorCidadeTipoDeServico.dart';
import 'package:projeto_treinamento/daos/prestadoresDeServicoPorCidadeTipoDeServico/dataModelPrestadoresDeServicoPorCidadeTipoDeServico.dart';
import 'package:projeto_treinamento/framework/providerDireto.dart';
import 'package:projeto_treinamento/providers/cidade/providerCidade.dart';
import 'package:projeto_treinamento/providers/dadosPrestador/providerDadosPrestador.dart';
import 'package:projeto_treinamento/providers/prestadorDeServico/providerPrestadorDeServicos.dart';
import 'package:projeto_treinamento/providers/tiposDeServico/providerTiposDeServico.dart';
import 'package:projeto_treinamento/util/resposta_processamento.dart';

import '../../framework/provider.dart';
import 'adapterPrestadoresDeServicoPorCidadeTipoDeServico.dart';

class ProviderPrestadoresDeServicoPorCidadeTipoDeServico extends Provider<BusinessModelPrestadoresDeServicoPorCidadeTipoDeServico> {

  

  @override
  Future<BusinessModelPrestadoresDeServicoPorCidadeTipoDeServico> getBusinessModel(String id) async{
    BusinessModelPrestadoresDeServicoPorCidadeTipoDeServico retornoBusinemodel = BusinessModelPrestadoresDeServicoPorCidadeTipoDeServico.vazio();
    List<String> ids = id.split("-");
    String codCidade = ids[0];
    String codTipoDeServico = ids[1];

    List<BusinessModelPrestadorDeServicos> prestadores=[];
    List<BusinessModelCidade> cidades = await ProviderCidade().getBusinessModels();
    BusinessModelTiposDeServico tipoDeServico = await ProviderTiposDeServico().getBusinessModel(codTipoDeServico);
    
    List<BusinessModelDadosPrestador> prestadoresDeServico = await ProvideDadosPrestador().getBusinessModels();
    
    prestadoresDeServico = prestadoresDeServico.where((e)=>e.city.contains(cidades[int.parse(codCidade)])) as List<BusinessModelDadosPrestador>;
    prestadoresDeServico = prestadoresDeServico.where((e)=>e.roles.contains(int.parse(codTipoDeServico))) as List<BusinessModelDadosPrestador>;
    
    prestadoresDeServico.forEach((prestador){
      prestadores.add(BusinessModelPrestadorDeServicos(codPrestadorServico: , nome: prestador.name, nota: , statusOnline: , telefone: prestador.phone, totalDeAvaliacoes: , totalDeAvaliacoesNota1: , totalDeAvaliacoesNota2: , totalDeAvaliacoesNota3: , totalDeAvaliacoesNota4: , totalDeAvaliacoesNota5: , urlFoto: ,))
    });

    
    BusinessModelPrestadoresDeServicoPorCidadeTipoDeServico(cidade: cidades[int.parse(codCidade)], prestadoresDeServico: prestadores , tipoDeServico: tipoDeServico,);
    
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
