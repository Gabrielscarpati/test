import 'package:projeto_treinamento/daos/dadosPrestador/dataModelBuilderDadosPrestador.dart';
import 'package:projeto_treinamento/daos/dadosPrestador/dataModelDadosPrestador.dart';
import 'package:projeto_treinamento/util/firebase/firebaseInterface.dart';

class FirebaseinterfaceDadosPrestador extends FirebaseInterface<DataModelDadosPrestador, DataModelBuilderDadosPrestador>{

  FirebaseinterfaceDadosPrestador({
    required String tableName,
    required DataModelBuilderDadosPrestador dataModelBuilder}) : super(tableName: tableName, dataModelBuilder: dataModelBuilder);

}