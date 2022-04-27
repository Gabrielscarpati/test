import 'package:projeto_treinamento/businessModels/businessModelCidade.dart';
import 'package:projeto_treinamento/daos/cidade/daoCidade.dart';
import 'package:projeto_treinamento/daos/cidade/dataModelCidade.dart';
import 'package:projeto_treinamento/framework/providerDireto.dart';

import 'adapterCidade.dart';

class ProviderCidade extends ProviderDireto<DataModelCidade, BusinessModelCidade, DaoCidade, AdapterCidade> {
  ProviderCidade()
      : super(
          dao: DaoCidade(),
          adapter: AdapterCidade(),
        );
}

// pegar um ou mais datamoveis(dao) e devolver business models