import 'package:projeto_treinamento/util/firebase/firebaseInterface.dart';

import 'dataModelBuilderVerifyIdentity.dart';
import 'dataModelVerifyIdentity.dart';

class FirebaseinterfaceVerifyIdentity extends FirebaseInterface<DataModelVerifyIdentity, DataModelBuilderVerifyIdentity>{

  FirebaseinterfaceVerifyIdentity({
    required String tableName,
    required DataModelBuilderVerifyIdentity dataModelBuilder}) : super(tableName: tableName, dataModelBuilder: dataModelBuilder);

}