import 'package:projeto_treinamento/framework/dataModel.dart';

class DataModelUsuario extends DataModel {
  final String email;
  final String nome;
  final String? urlFoto;
  final String phone;
  final String city;
  final String description;
  final String roles;
  final String workingHours;
  final String brazilianID;
  final String brazilianIDpicture;


  DataModelUsuario({
    required this.email,
    required this.nome,
    required this.urlFoto,
    required this.phone,
    required this.city,
    required this.description,
    required this.roles,
    required this.workingHours,
    required this.brazilianID,
    required this.brazilianIDpicture,


  }) : super(id: email.toString());
}
