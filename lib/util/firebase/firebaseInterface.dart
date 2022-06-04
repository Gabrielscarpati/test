import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:projeto_treinamento/framework/dataModel.dart';
import 'package:projeto_treinamento/framework/dataModelBuilder.dart';
import 'package:projeto_treinamento/util/resposta_processamento.dart';

class FirebaseInterface<D extends DataModel, DB extends DataModelBuilder<D>> {
  final FirebaseAuth auth = FirebaseAuth.instance;
  final String tableName;
  final DB dataModelBuilder;

  FirebaseInterface({required this.tableName, required this.dataModelBuilder});

  Future<String?> getUserId() async {
    final User? user = await auth.currentUser;
    final userId = user?.uid.toString();
    return userId;
  }

  FirebaseFirestore? _instance;

  Future<D?> getDataModelFromFirebase() async {
    _instance = FirebaseFirestore.instance;

    CollectionReference dadosPrestador =
    _instance!.collection(tableName);

    DocumentSnapshot snapshot =
    await dadosPrestador.doc(await getUserId()).get();

    var data = snapshot.data() as Map<String, dynamic>;
    var dataTable = data[tableName];
    print(dataTable);

    String? IdUsuario = await getUserId();

    if (IdUsuario != null) {
      D? dataModel = dataModelBuilder.createDataModel(dataTable);
      if (dataModel != null) {
        print(dataModel.toString());
        return dataModel;
      }
    }
  }

  Future<RespostaProcessamento> saveDataModelInFirebase(
      D dataModel,
      ) async {
    final FirebaseAuth auth = FirebaseAuth.instance;
    FirebaseFirestore firestore = FirebaseFirestore.instance;

    RespostaProcessamento response = RespostaProcessamento.ok();
    try {
      await firestore
          .collection('dadosPrestador')
          .doc(await getUserId())
          .update(
          dataModelBuilder.createJson(dataModel) as Map<String, dynamic>);
    } catch (err) {
      response = RespostaProcessamento.erro(err.toString());
    }
    return response;
  }
}