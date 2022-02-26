import 'package:projeto_treinamento/businessModels/businessModelPrincipaisTiposDeServicoCidade.dart';
import 'package:projeto_treinamento/daos/principaisTiposDeServicoCidade/daoPrincipaisTiposDeServicoCidade.dart';
import 'package:projeto_treinamento/daos/principaisTiposDeServicoCidade/dataModelPrincipaisTiposDeServicoCidade.dart';
import 'package:projeto_treinamento/framework/providerDireto.dart';

import 'adapterPrincipaisTiposDeServicoCidade.dart';

class ProviderPrincipaisTiposDeServicoCidade extends ProviderDireto<DataModelPrincipaisTiposDeServicoCidade, BusinessModelPrincipaisTiposDeServicoCidade, DaoPrincipaisTiposDeServicoCidade, AdapterPrincipaisTiposDeServicoCidade> {
  ProviderPrincipaisTiposDeServicoCidade()
      : super(
          dao: DaoPrincipaisTiposDeServicoCidade(),
          adapter: AdapterPrincipaisTiposDeServicoCidade(),
        );
}
