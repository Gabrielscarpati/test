import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'dataModePrestadorInformation.dart';
import 'dataModelBuilderPrestadorInformation.dart';

class UsuarioData{
  final FirebaseAuth auth = FirebaseAuth.instance;
  
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


















