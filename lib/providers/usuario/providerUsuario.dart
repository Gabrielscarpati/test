import 'package:projeto_treinamento/businessModels/businessModelUsuario.dart';
import 'package:projeto_treinamento/daos/usuario/daoUsuario.dart';
import 'package:projeto_treinamento/daos/usuario/dataModelUsuario.dart';
import 'package:projeto_treinamento/framework/providerDireto.dart';

import 'adapterUsuario.dart';

class ProviderUsuario extends ProviderDireto<DataModelUsuario, BusinessModelUsuario, DaoUsuario, AdapterUsuario> {
  ProviderUsuario()
      : super(
          dao: DaoUsuario(),
          adapter: AdapterUsuario(),
        );
}
