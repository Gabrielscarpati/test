import 'package:projeto_treinamento/businessModels/businessModelPrestadorDeServicos.dart';
import 'package:projeto_treinamento/daos/prestadorDeServicoXCidade/daoPrestadorDeServicoXCidade.dart';
import 'package:projeto_treinamento/daos/prestadorDeServicoXTipoDeServico/daoPrestadorDeServicoXTipoDeServico.dart';
import 'package:projeto_treinamento/daos/prestadorDeServicoXTipoDeServico/dataModelPrestadorDeServicoXTipoDeServico.dart';
import 'package:projeto_treinamento/daos/prestadorDeServicos/daoPrestadorDeServicos.dart';
import 'package:projeto_treinamento/daos/prestadorDeServicos/dataModelPrestadorDeServicos.dart';
import 'package:projeto_treinamento/framework/providerDireto.dart';
import 'package:projeto_treinamento/providers/prestadorDeServico/adapterPrestadorDeServico.dart';
import 'package:projeto_treinamento/providers/prestadorDeServicoXTipoDeServico/providerPrestadorDeServicoXTipoDeServico.dart';
import 'package:projeto_treinamento/util/resposta_processamento.dart';

class ProviderPrestadorDeServicos extends ProviderDireto<DataModelPrestadorDeServicos, BusinessModelPrestadorDeServicos, DaoPrestadorDeServicos, AdapterPrestadorDeServico> {
  ProviderPrestadorDeServicos() : super(dao: DaoPrestadorDeServicos(), adapter: AdapterPrestadorDeServico());

  @override
  Future<RespostaProcessamento> saveBusinessModel(BusinessModelPrestadorDeServicos businessModel) async {
    DaoPrestadorDeServicos dao = DaoPrestadorDeServicos();
    DataModelPrestadorDeServicos dataModel = await AdapterPrestadorDeServico().createDataModel(businessModel);
    dao.saveDataModel(dataModel);
    List<DataModelPrestadorDeServicoXTipoDeServico> dataModels = List.empty(growable: true);
    // nao sabemos ainda como vamos vincular os tipos de servico ao prestador (nao estamos usando isso dentro do businessmodel de prestador de servico)
    //businessModel.tiposDeServico.forEach((element) {
    //  dataModels.add(DataModelPrestadorDeServicoXTipoDeServico(codPrestadorDeServico: businessModel.codPrestadorServico, codTipoDeServico: element.codTipoServico));
    //});
    DaoPrestadorDeServicoXTipoDeServico dao2 = DaoPrestadorDeServicoXTipoDeServico();
    return dao2.saveDataModelsByPrestadorDeServico(businessModel.codPrestadorServico, dataModels);
  }

  Future<List<BusinessModelPrestadorDeServicos>> getBusinessModelsByCodTipoDeServicoCidade(int codTipoDeServico, int codCidade) async {
    List<BusinessModelPrestadorDeServicos> list = List.empty(growable: true);
    List<DataModelPrestadorDeServicoXTipoDeServico> listaDeDataModelsPrestadoresDeServicoxTipoDeServico = ProviderPrestadorDeServicoXTipoDeServico().getDataModelsByTipoDeServico(codTipoDeServico);
    for (DataModelPrestadorDeServicoXTipoDeServico dataModelPrestadorxTipoDeServico in listaDeDataModelsPrestadoresDeServicoxTipoDeServico) {
      if (DaoPrestadorDeServicoXCidade().verificaSePrestadorAtendeNaCidade(dataModelPrestadorxTipoDeServico.codPrestadorDeServico, codCidade)) {
        BusinessModelPrestadorDeServicos prestadorDeServicos = await getBusinessModel(dataModelPrestadorxTipoDeServico.codPrestadorDeServico.toString());
        list.add(prestadorDeServicos);
      }
    }
    return list;
  }
}
