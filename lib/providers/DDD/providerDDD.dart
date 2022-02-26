import 'package:projeto_treinamento/daos/ddd/daoDDD.dart';
import 'package:projeto_treinamento/daos/ddd/dataModelDDD.dart';
import 'package:projeto_treinamento/framework/providerDireto.dart';

import '../../businessModels/businessModelDDD.dart';
import 'adapterDDD.dart';

class ProviderDDD extends ProviderDireto<DataModelDDD, BusinessModelDDD, DaoDDD, AdapterDDD> {
  ProviderDDD() : super(dao: DaoDDD(), adapter: AdapterDDD());

  List<int> getCodigosDDDs() {
    return dao.getCodigosDDDs();
  }
}
