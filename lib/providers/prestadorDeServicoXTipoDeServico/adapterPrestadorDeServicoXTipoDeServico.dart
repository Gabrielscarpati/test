import 'package:projeto_treinamento/businessModels/businessModelPrestadorDeServicoxTipoDeServico.dart';
import 'package:projeto_treinamento/daos/prestadorDeServicoXTipoDeServico/dataModelPrestadorDeServicoXTipoDeServico.dart';
import 'package:projeto_treinamento/framework/adapter.dart';

class AdapterPrestadorDeServicoXTipoDeServico extends Adapter<BusinessModelPrestadorDeServicoXTipoDeServico, DataModelPrestadorDeServicoXTipoDeServico> {
  @override
  Future<BusinessModelPrestadorDeServicoXTipoDeServico> createBusinessModel(DataModelPrestadorDeServicoXTipoDeServico? dataModel) async {
    if (dataModel == null)
      return BusinessModelPrestadorDeServicoXTipoDeServico.vazio();
    else
      return BusinessModelPrestadorDeServicoXTipoDeServico(
        codPrestadorDeServico: dataModel.codPrestadorDeServico,
        codTipoDeServico: dataModel.codTipoDeServico,
      );
  }

  @override
  Future<DataModelPrestadorDeServicoXTipoDeServico> createDataModel(BusinessModelPrestadorDeServicoXTipoDeServico businessModel) async {
    return DataModelPrestadorDeServicoXTipoDeServico(
      codPrestadorDeServico: businessModel.codPrestadorDeServico,
      codTipoDeServico: businessModel.codTipoDeServico,
    );
  }
}
