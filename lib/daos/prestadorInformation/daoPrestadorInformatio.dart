import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:projeto_treinamento/framework/dao.dart';
import 'package:projeto_treinamento/util/resposta_processamento.dart';
import 'package:projeto_treinamento/framework/dataModel.dart';
import '../../framework/daoWebApi.dart';
import '../usuario/dataModelBuilderUsuario.dart';
import '../usuario/dataModelUsuario.dart';
import 'dataModePrestadorInformation.dart';
import 'dataModelBuilderPrestadorInformation.dart';

class DaoPrestadorInformation extends Dao<DataModelPrestadorInformation> {
  final FirebaseAuth auth = FirebaseAuth.instance;

  DaoPrestadorInformation();

  Future<String?> getUserId() async {
    final User? user = await auth.currentUser;
    final userId = user?.uid.toString();
    return userId;
  }

  FirebaseFirestore? _instance;

  Future<DataModelPrestadorInformation?> getUserDataFromFirebase() async {
    _instance = FirebaseFirestore.instance;

    CollectionReference dadosPrestador =
        _instance!.collection('dadosPrestador');

    DocumentSnapshot snapshot =
        await dadosPrestador.doc(await getUserId()).get();

    var data = snapshot.data() as Map<String, dynamic>;
    var prestadorData = data['description'];

    String? IdUsuario = await getUserId();

    if (IdUsuario != null) {
      DataModelPrestadorInformation? dataModel =
          DataModelBuilderPrestadorInfomation(IdUsuario: IdUsuario)
              .createDataModel(data);
      if (dataModel != null) {
        return dataModel;
      }
    }
  }

  @override
  Future<DataModelPrestadorInformation?> getDataModel(String id) {
    return getUserDataFromFirebase();
    // TODO: implement getDataModel
    throw UnimplementedError();
  }

  @override
  Future<List<DataModelPrestadorInformation>> getDataModels() {
    // TODO: implement getDataModels
    throw UnimplementedError();
  }

  @override
  Future<RespostaProcessamento> removeDataModel(DataModel dataModel) {
    // TODO: implement removeDataModel
    throw UnimplementedError();
  }

  @override
  Future<RespostaProcessamento> saveDataModel(DataModel dataModel) {
    // TODO: implement saveDataModel
    throw UnimplementedError();
  }
}

class DaoPrestadorInformationUpdate {
  final FirebaseAuth auth = FirebaseAuth.instance;
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  Future<String?> getUserId() async {
    final User? user = await auth.currentUser;
    final userId = user?.uid.toString();
    return userId;
  }

  updatePrestadorInformation(
      {required DataModelPrestadorInformation dataModel}) async {
    await firestore.collection('dadosPrestador').doc(await getUserId()).update({
      'phone': dataModel.phone,
      'city': dataModel.city,
      'description': dataModel.description,
      'roles': dataModel.roles,
      'workingHours': dataModel.workingHours,
      'brazilianID': dataModel.brazilianID,
      'brazilianIDPicture': dataModel.brazilianIDPicture,
      'profilePicture': dataModel.profilePicture,
      'name': dataModel.name,
    });
  }
}
