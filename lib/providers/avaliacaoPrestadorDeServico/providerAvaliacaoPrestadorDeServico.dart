import 'package:projeto_treinamento/businessModels/businessModelAvaliacaoPrestadorDeServico.dart';
import 'package:projeto_treinamento/daos/avaliacaoPrestadorDeServico/daoAvaliacaoPrestadorDeServico.dart';
import 'package:projeto_treinamento/daos/avaliacaoPrestadorDeServico/dataModelAvaliacaoPrestadorDeServico.dart';
import 'package:projeto_treinamento/framework/providerDireto.dart';

import 'adapterAvaliacaoPrestadorDeServico.dart';

class ProviderAvaliacaoPrestadorDeServico extends ProviderDireto<DataModelAvaliacaoPrestadorDeServico, BusinessModelAvaliacaoPrestadorDeServico, DaoAvaliacaoPrestadorDeServico, AdapterAvaliacaoPrestadorDeServico> {
  ProviderAvaliacaoPrestadorDeServico() : super(dao: DaoAvaliacaoPrestadorDeServico(), adapter: AdapterAvaliacaoPrestadorDeServico());

  Future<List<BusinessModelAvaliacaoPrestadorDeServico>> getBusinessModelsByCodPrestadorDeServico(int codPrestadorDeServico) async {
    List<DataModelAvaliacaoPrestadorDeServico> dataModels = await this.dao.getDataModelsById(codPrestadorDeServico.toString());
    List<BusinessModelAvaliacaoPrestadorDeServico> businessModels = List.empty(growable: true);
    for (DataModelAvaliacaoPrestadorDeServico dataModel in dataModels) {
      BusinessModelAvaliacaoPrestadorDeServico businessModel = await AdapterAvaliacaoPrestadorDeServico().createBusinessModel(dataModel);
      businessModels.add(businessModel);
    }
    return businessModels;
  }
}
