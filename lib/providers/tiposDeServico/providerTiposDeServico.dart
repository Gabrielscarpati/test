import 'package:projeto_treinamento/framework/providerDireto.dart';
import 'package:projeto_treinamento/providers/tiposDeServico/adapterTipoDeServico.dart';

import '../../businessModels/businessModelTiposDeServico.dart';
import '../../daos/tiposDeServico/daoTipoDeServico.dart';
import '../../daos/tiposDeServico/dataModelTipoDeServico.dart';

class ProviderTiposDeServico extends ProviderDireto<DataModelTipoDeServico, BusinessModelTiposDeServico, DaoTipoDeServico, AdapterTipoDeServico> {
  ProviderTiposDeServico() : super(dao: DaoTipoDeServico(), adapter: AdapterTipoDeServico());
}
