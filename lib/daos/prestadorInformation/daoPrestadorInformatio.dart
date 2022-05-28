import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../framework/daoWebApi.dart';
import '../usuario/dataModelBuilderUsuario.dart';
import '../usuario/dataModelUsuario.dart';
import 'dataModePrestadorInformation.dart';
import 'dataModelBuilderPrestadorInformation.dart';



class DaoPrestadorInformation extends  DaoWebApi<DataModelUsuario, DataModelBuilderUsuario> {
  final FirebaseAuth auth = FirebaseAuth.instance;

   /**/DaoPrestadorInformation({required String server, required String model, required DataModelBuilderUsuario dataModelBuilder}) : super(server: server, model: model, dataModelBuilder: dataModelBuilder);
  
  Future<String?> getUserId() async {
    final User? user = await auth.currentUser;
    final userId = user?.uid.toString();
    return userId;
  }

  List<DataModelPrestadorInformation> _DataModelPrestadorInformation =[];

  List<DataModelPrestadorInformation> getDataModelPrestadorInformation(){
    return _DataModelPrestadorInformation;
  }

    FirebaseFirestore? _instance;

    Future< DataModelPrestadorInformation?> getUserDataFromFirebase ()async {
      _instance = FirebaseFirestore.instance;

      CollectionReference dadosPrestador = _instance!.collection('dadosPrestador');

      DocumentSnapshot snapshot = await dadosPrestador.doc(await getUserId()).get();

      var data = snapshot.data() as Map<String, dynamic>;
      var prestadorData = data['description'];
      print(data);

      String? IdUsuario = await getUserId();

      if(IdUsuario != null){

      DataModelPrestadorInformation? dataModel = DataModelBuilderPrestadorInfomation(IdUsuario: IdUsuario ).createDataModel(data);
        if (dataModel!= null){
        print(dataModel.toString());
        return dataModel;
       }
      }
    }
}

class DaoPrestadorInformationUpdate{
  
  final FirebaseAuth auth = FirebaseAuth.instance;
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  Future<String?> getUserId() async {
    final User? user = await auth.currentUser;
    final userId = user?.uid.toString();
    return userId;
  }

  updatePrestadorInformation({required DataModelPrestadorInformation dataModel}) async{
    await firestore.collection('dadosPrestador').doc(await getUserId()).update({
      'phone' : dataModel.phone,
      'city' : dataModel.city,
      'description' : dataModel.description,
      'roles' : dataModel.roles,
      'workingHours' : dataModel.workingHours,
      'brazilianID' : dataModel.brazilianID,
      'brazilianIDPicture' : dataModel.brazilianIDPicture,
      'profilePicture' : dataModel.profilePicture,
      'name' : dataModel.name,
    }
    );
  }
}





