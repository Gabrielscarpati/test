import 'package:flutter/material.dart';
import 'package:projeto_treinamento/framework/provider.dart';
import 'package:projeto_treinamento/framework/providerDireto.dart';
import 'package:projeto_treinamento/providers/tiposDeServico/adapterTipoDeServico.dart';
import 'package:projeto_treinamento/util/resposta_processamento.dart';
import 'package:projeto_treinamento/util/tipoDeServico.dart';

import '../../businessModels/businessModelTiposDeServico.dart';
import '../../daos/tiposDeServico/daoTipoDeServico.dart';
import '../../daos/tiposDeServico/dataModelTipoDeServico.dart';
import '../../util/getIconeTipoServico.dart';

class ProviderTiposDeServico extends Provider<BusinessModelTiposDeServico> {
  DaoTipoDeServico dao = DaoTipoDeServico();
  GetIconeTipoServico getIconeTipoServico = GetIconeTipoServico(nomeIcon: '');
  @override
  Future<BusinessModelTiposDeServico> getBusinessModel(String id) async {
    List<BusinessModelTiposDeServico> listaTiposDeServico =
        TipoDeServico().listaTodosPrestadores;
    return listaTiposDeServico[int.parse(id)];
  }

  @override
  Future<List<BusinessModelTiposDeServico>> getBusinessModels() async {
    // TODO: implement getBusinessModels
    List<BusinessModelTiposDeServico> listaDeTiposDeServico = [];
    List<DataModelTipoDeServico> listaDataModels = [];

    listaDataModels = await dao.getDataModels();
    int index = 0;
    listaDataModels.forEach((element) {
      index++;
      listaDeTiposDeServico.add(BusinessModelTiposDeServico(
          codTipoServico: element.codTipoServico,
          descricao: element.descricao,
          icone: getIconeTipoServico.getIconeTipoServico(element.descricao),
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
