import 'package:projeto_treinamento/businessModels/businessModelPrestadorDeServicoxCidade.dart';
import 'package:projeto_treinamento/daos/prestadorDeServicoXCidade/daoPrestadorDeServicoXCidade.dart';
import 'package:projeto_treinamento/daos/prestadorDeServicoXCidade/dataModelPrestadorDeServicoXCidade.dart';
import 'package:projeto_treinamento/framework/providerDireto.dart';

import 'adapterPrestadorDeServicoXCidade.dart';

class ProviderPrestadorDeServicoXCidade extends ProviderDireto<DataModelPrestadorDeServicoXCidade, BusinessModelPrestadorDeServicoXCidade, DaoPrestadorDeServicoXCidade, AdapterPrestadorDeServicoXCidade> {
  ProviderPrestadorDeServicoXCidade() : super(adapter: AdapterPrestadorDeServicoXCidade(), dao: DaoPrestadorDeServicoXCidade());

  int getQuantidadePrestadoresCidade(int codCidade) {
    return dao.getQuantidadePrestadoresCidade(codCidade);
  }
}
