import 'package:projeto_treinamento/framework/dataModel.dart';

class DataModelUsuario extends DataModel {
  final String email;
  final String nome;

  DataModelUsuario({
    required this.email,
    required this.nome,

  }) : super(id: email.toString());
}
