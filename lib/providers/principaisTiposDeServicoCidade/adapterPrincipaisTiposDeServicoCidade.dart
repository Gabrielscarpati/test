import 'package:projeto_treinamento/businessModels/businessModelCidade.dart';
import 'package:projeto_treinamento/businessModels/businessModelPrincipaisTiposDeServicoCidade.dart';
import 'package:projeto_treinamento/businessModels/businessModelTiposDeServico.dart';
import 'package:projeto_treinamento/daos/principaisTiposDeServicoCidade/dataModelPrincipaisTiposDeServicoCidade.dart';
import 'package:projeto_treinamento/framework/adapter.dart';
import 'package:projeto_treinamento/providers/cidade/adapterCidade.dart';
import 'package:projeto_treinamento/providers/tiposDeServico/adapterTipoDeServico.dart';

class AdapterPrincipaisTiposDeServicoCidade extends Adapter<BusinessModelPrincipaisTiposDeServicoCidade, DataModelPrincipaisTiposDeServicoCidade> {
  @override
  Future<BusinessModelPrincipaisTiposDeServicoCidade> createBusinessModel(DataModelPrincipaisTiposDeServicoCidade? dataModel) async {
    if (dataModel == null)
      return BusinessModelPrincipaisTiposDeServicoCidade.vazio();
    else {
      List<BusinessModelTiposDeServico> tiposDeServico = List.empty(growable: true);
      for (int i = 0; i < dataModel.tiposDeServico.length; i++) {
        BusinessModelTiposDeServico businessModelTiposDeServico = await AdapterTipoDeServico().createBusinessModel(dataModel.tiposDeServico[i]);
        tiposDeServico.add(businessModelTiposDeServico);
      }

      BusinessModelCidade cidade = await AdapterCidade().createBusinessModel(dataModel.cidade);

      return BusinessModelPrincipaisTiposDeServicoCidade(
        cidade: cidade,
        tiposDeServico: tiposDeServico,
      );
    }
  }

  @override
  Future<DataModelPrincipaisTiposDeServicoCidade> createDataModel(BusinessModelPrincipaisTiposDeServicoCidade businessModel) async {
    List<int> principaisTiposDeServico = List.empty(growable: true);
    businessModel.tiposDeServico.forEach((tipoDeServico) {
      principaisTiposDeServico.add(tipoDeServico.codTipoServico);
    });
    return DataModelPrincipaisTiposDeServicoCidade(
      cidade: await AdapterCidade().createDataModel(businessModel.cidade),
      tiposDeServico: List.empty(growable: true),
    );
  }
}
