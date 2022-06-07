import 'package:flutter/material.dart';
import 'package:projeto_treinamento/framework/provider.dart';
import 'package:projeto_treinamento/framework/providerDireto.dart';
import 'package:projeto_treinamento/providers/tiposDeServico/adapterTipoDeServico.dart';
import 'package:projeto_treinamento/util/resposta_processamento.dart';

import '../../businessModels/businessModelTiposDeServico.dart';
import '../../daos/tiposDeServico/daoTipoDeServico.dart';
import '../../daos/tiposDeServico/dataModelTipoDeServico.dart';

class ProviderTiposDeServico extends Provider<BusinessModelTiposDeServico> {
  DaoTipoDeServico dao = DaoTipoDeServico();
  @override
  Future<BusinessModelTiposDeServico> getBusinessModel(String id) async {
    List<BusinessModelTiposDeServico> listaTiposDeServico =
        await getBusinessModels();
    print(listaTiposDeServico);
    return listaTiposDeServico[int.parse(id)];
  }

  @override
  Future<List<BusinessModelTiposDeServico>> getBusinessModels() async {
    // TODO: implement getBusinessModels
    List<BusinessModelTiposDeServico> listaDeTiposDeServico = [];
    List<DataModelTipoDeServico> listaDataModels = [];

    listaDataModels = await dao.getDataModels();
    listaDataModels.forEach((element) {
      listaDeTiposDeServico.add(BusinessModelTiposDeServico(
          codTipoServico: element.codTipoServico,
          descricao: element.descricao,
          icone: Icons.add,
          qtdePrestadoresDeServico: 0));
    });

    return listaDeTiposDeServico;
  }

  @override
  Future<RespostaProcessamento> removeBusinessModel(
      BusinessModelTiposDeServico businessModel) {
    // TODO: implement removeBusinessModel
    throw UnimplementedError();
  }

  @override
  Future<RespostaProcessamento> saveBusinessModel(
      BusinessModelTiposDeServico businessModel) {
    // TODO: implement saveBusinessModel
    throw UnimplementedError();
  }
}
