import 'package:projeto_treinamento/daos/prestadorDeServicos/dataModelBuilderPrestadorDeServicos.dart';
import 'package:projeto_treinamento/framework/daoWebApi.dart';

import 'dataModelPrestadorDeServicos.dart';

class DaoPrestadorDeServicos extends DaoWebApi<DataModelPrestadorDeServicos, DataModelBuilderPrestadorDeServicos> {
  DaoPrestadorDeServicos()
      : super(
          dataModelBuilder: DataModelBuilderPrestadorDeServicos(),
          server: "https://voadragons.com",
          model: "prestadorservico",
        );
}
