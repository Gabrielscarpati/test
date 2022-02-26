import 'package:projeto_treinamento/daos/principaisTiposDeServicoCidade/dataModelBuilderPrincipaisTiposDeServicoCidade.dart';
import 'package:projeto_treinamento/framework/daoWebApi.dart';

import 'dataModelPrincipaisTiposDeServicoCidade.dart';

class DaoPrincipaisTiposDeServicoCidade extends DaoWebApi<DataModelPrincipaisTiposDeServicoCidade, DataModelBuilderPrincipaisTipoDeServicoCidade> {
  DaoPrincipaisTiposDeServicoCidade()
      : super(
          dataModelBuilder: DataModelBuilderPrincipaisTipoDeServicoCidade(),
          server: "https://voadragons.com",
          model: "principais_tipos_de_servico_por_cidade",
        );
}
