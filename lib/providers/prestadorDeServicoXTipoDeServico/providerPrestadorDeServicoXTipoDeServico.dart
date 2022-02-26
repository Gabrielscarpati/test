import 'package:projeto_treinamento/businessModels/businessModelPrestadorDeServicoxTipoDeServico.dart';
import 'package:projeto_treinamento/daos/prestadorDeServicoXCidade/daoPrestadorDeServicoXCidade.dart';
import 'package:projeto_treinamento/daos/prestadorDeServicoXTipoDeServico/daoPrestadorDeServicoXTipoDeServico.dart';
import 'package:projeto_treinamento/daos/prestadorDeServicoXTipoDeServico/dataModelPrestadorDeServicoXTipoDeServico.dart';
import 'package:projeto_treinamento/framework/providerDireto.dart';
import 'package:projeto_treinamento/providers/prestadorDeServicoXTipoDeServico/adapterPrestadorDeServicoXTipoDeServico.dart';

class ProviderPrestadorDeServicoXTipoDeServico extends ProviderDireto<DataModelPrestadorDeServicoXTipoDeServico, BusinessModelPrestadorDeServicoXTipoDeServico, DaoPrestadorDeServicoXTipoDeServico, AdapterPrestadorDeServicoXTipoDeServico> {
  ProviderPrestadorDeServicoXTipoDeServico() : super(adapter: AdapterPrestadorDeServicoXTipoDeServico(), dao: DaoPrestadorDeServicoXTipoDeServico());

  int getQuantidadePrestadoresTipoDeServicoCidade(int codTipoDeServico, int codCidade) {
    int totalDePrestadoresDeServico = 0;
    List<DataModelPrestadorDeServicoXTipoDeServico> listPrestadoresDeServico = dao.getDataModelsByTipoDeServico(codTipoDeServico);
    listPrestadoresDeServico.forEach( (dataModel) {
       if (DaoPrestadorDeServicoXCidade().verificaSePrestadorAtendeNaCidade(dataModel.codPrestadorDeServico, codCidade)) totalDePrestadoresDeServico++;

    });
    return totalDePrestadoresDeServico;
  }

  List<DataModelPrestadorDeServicoXTipoDeServico> getDataModelsByTipoDeServico(int codTipoDeServico) {
    return dao.getDataModelsByTipoDeServico(codTipoDeServico);
  }
}
