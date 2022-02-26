import 'package:projeto_treinamento/framework/dataModel.dart';

class DataModelUsuario extends DataModel {
  final String email;
  final String nome;
  final String? urlFoto;

  DataModelUsuario({
    required this.email,
    required this.nome,
    required this.urlFoto,
  }) : super(id: email.toString());
}
