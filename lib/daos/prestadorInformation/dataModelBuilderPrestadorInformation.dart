import 'package:projeto_treinamento/framework/dataModelBuilder.dart';

import 'daoUsuario.dart';
import 'dataModePrestadorInformation.dart';



class DataModelBuilderPrestadorInfomation {
 final String IdUsuario;

 DataModelBuilderPrestadorInfomation({required this.IdUsuario});

  DataModelPrestadorInformation? createDataModel(Map<String, dynamic> json) {
    return DataModelPrestadorInformation(
      phone:  json['phone'],
      city:  json['city'],
      description:  json['description'],
      roles:  json['roles'],
      workingHours:  json['workingHours'],
      brazilianID: json['brazilianID'],
      brazilianIDPicture:  json['brazilianIDPicture'],
      profilePicture:  json['profilePicture'],
      name: json['name'],
      IdUsuario: IdUsuario,
    );
  }

  @override
  Map<String, dynamic>? createJson(DataModelPrestadorInformation? dataModel) {
    if (dataModel == null) return null;
    return {"phone": dataModel.phone,
      "city": dataModel.city,
      "description": dataModel.description,
      "roles": dataModel.roles,
      "workingHours": dataModel.workingHours,
      "brazilianID": dataModel.brazilianID,
      "brazilianIDPicture": dataModel.brazilianIDPicture,
      "profilePicture": dataModel.profilePicture,
      "name": dataModel.name,
    };
  }
}