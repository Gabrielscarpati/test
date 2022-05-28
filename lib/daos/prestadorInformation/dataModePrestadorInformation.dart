import 'package:projeto_treinamento/framework/dataModel.dart';

class DataModelPrestadorInformation extends DataModel {

  final String brazilianID ;
  final String brazilianIDPicture;
  final String city;
  final String description;
  final String name;
  final String phone;
  final String profilePicture;
  final String roles;
  final String workingHours;
  final String IdUsuario;


  DataModelPrestadorInformation({
    required this.brazilianID,
    required this.brazilianIDPicture,
    required this.city,
    required this.description,
    required this.name,
    required this.phone,
    required this.profilePicture,
    required this.roles,
    required this.workingHours,
    required this.IdUsuario,


  }): super(id: IdUsuario.toString());


}

