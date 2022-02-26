import 'package:projeto_treinamento/framework/daoWebApi.dart';

import 'dataModelBuilderUsuario.dart';
import 'dataModelUsuario.dart';

class DaoUsuario extends DaoWebApi<DataModelUsuario, DataModelBuilderUsuario> {
  DaoUsuario()
      : super(
          dataModelBuilder: DataModelBuilderUsuario(),
          server: "https://127.0.0.1/api-projeto-treinamento",
          model: "usuario",
        );
}
