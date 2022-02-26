import 'package:projeto_treinamento/businessModels/businessModelPrestadorDeServicos.dart';
import 'package:projeto_treinamento/businessModels/businessModelPrestadoresDeServicoPorCidadeTipoDeServico.dart';
import 'package:projeto_treinamento/daos/prestadorDeServicos/dataModelPrestadorDeServicos.dart';
import 'package:projeto_treinamento/daos/prestadoresDeServicoPorCidadeTipoDeServico/dataModelPrestadoresDeServicoPorCidadeTipoDeServico.dart';
import 'package:projeto_treinamento/framework/adapter.dart';
import 'package:projeto_treinamento/providers/cidade/adapterCidade.dart';
import 'package:projeto_treinamento/providers/prestadorDeServico/adapterPrestadorDeServico.dart';
import 'package:projeto_treinamento/providers/tiposDeServico/adapterTipoDeServico.dart';

class AdapterPrestadoresDeServicoPorCidadeTipoDeServico extends Adapter<BusinessModelPrestadoresDeServicoPorCidadeTipoDeServico, DataModelPrestadoresDeServicoPorCidadeTipoDeServico> {
  Future<BusinessModelPrestadoresDeServicoPorCidadeTipoDeServico> createBusinessModel(DataModelPrestadoresDeServicoPorCidadeTipoDeServico? dataModelPrestadorDeServicos) async {
    if (dataModelPrestadorDeServicos == null) {
      return BusinessModelPrestadoresDeServicoPorCidadeTipoDeServico.vazio();
    }
    return BusinessModelPrestadoresDeServicoPorCidadeTipoDeServico(
      cidade: await AdapterCidade().createBusinessModel(dataModelPrestadorDeServicos.cidade),
      tipoDeServico: await AdapterTipoDeServico().createBusinessModel(dataModelPrestadorDeServicos.tipoServico),
      prestadoresDeServico: await _getPrestadoresDeServicosoFromJson(dataModelPrestadorDeServicos.prestadoresServico),
    );
  }

  Future<List<BusinessModelPrestadorDeServicos>> _getPrestadoresDeServicosoFromJson(List<DataModelPrestadorDeServicos> dataModels) async {
    List<BusinessModelPrestadorDeServicos> lista = List.empty(growable: true);
    for (var dataModel in dataModels) {
      lista.add(await AdapterPrestadorDeServico().createBusinessModel(dataModel));
    }
    return lista;
  }

  @override
  Future<DataModelPrestadoresDeServicoPorCidadeTipoDeServico> createDataModel(BusinessModelPrestadoresDeServicoPorCidadeTipoDeServico businessModel) async {
    return DataModelPrestadoresDeServicoPorCidadeTipoDeServico(
      cidade: await AdapterCidade().createDataModel(businessModel.cidade),
      tipoServico: await AdapterTipoDeServico().createDataModel(businessModel.tipoDeServico),
      prestadoresServico: List.empty(growable: true),
    );
  }
}
