import 'package:projeto_treinamento/daos/dadosPrestador/dataModelBuilderDadosPrestador.dart';
import 'package:projeto_treinamento/daos/dadosPrestador/dataModelDadosPrestador.dart';
import 'package:projeto_treinamento/daos/principaisTiposDeServicoCidade/dataModelPrincipaisTiposDeServicoCidade.dart';
import 'package:projeto_treinamento/daos/tiposDeServico/dataModelBuilderTipoDeServico.dart';
import 'package:projeto_treinamento/daos/tiposDeServico/dataModelTipoDeServico.dart';
import 'package:projeto_treinamento/util/firebase/firebaseInterface.dart';

class FirebaseinterfaceTiposDeServico extends FirebaseInterface<
    DataModelTipoDeServico, DataModelBuilderTipoDeServico> {
  FirebaseinterfaceTiposDeServico(
      {required String tableName,
      required DataModelBuilderTipoDeServico dataModelBuilder})
      : super(tableName: tableName, dataModelBuilder: dataModelBuilder);
}
