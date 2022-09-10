
import '../../framework/dao.dart';
import '../../util/resposta_processamento.dart';
import 'dataModelBuilderVerifyIdentity.dart';
import 'dataModelVerifyIdentity.dart';
import 'firebaseInterfaceVerifyIdentity.dart';

class DaoVerifyIdentity extends Dao<DataModelVerifyIdentity> {
  FirebaseinterfaceVerifyIdentity firebaseInterface =
      FirebaseinterfaceVerifyIdentity(
    tableName: 'dadosPrestador',
    dataModelBuilder: DataModelBuilderVerifyIdentity(),
  );

  Future<DataModelVerifyIdentity?> getDataModel(String id) async {
    DataModelVerifyIdentity? dataModelVerifyIdentity;
    dataModelVerifyIdentity = await firebaseInterface.getDataModelFromFirebase();
    return dataModelVerifyIdentity;
  }

  Future<List<DataModelVerifyIdentity>> getDataModels() async {
    List<DataModelVerifyIdentity> listaDataModelVerifyIdentity = [];
    listaDataModelVerifyIdentity = await firebaseInterface
        .getDataModelsFromFirebase(DataModelBuilderVerifyIdentity());

    return listaDataModelVerifyIdentity;
  }

  Future<RespostaProcessamento> saveDataModel(
      DataModelVerifyIdentity dataModel) async {
    return RespostaProcessamento.ok();
  }

  Future<RespostaProcessamento> removeDataModel(
      DataModelVerifyIdentity dataModel) async {
    return RespostaProcessamento.ok();
  }
}
