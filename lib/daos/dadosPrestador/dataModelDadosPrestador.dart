import 'package:projeto_treinamento/framework/dataModel.dart';

class DataModelDadosPrestador extends DataModel {
  final String name;
  final String phone;
  final String workingHours;
  final String description;
  final String profilePicture;
  final String city;
  final String roles;
  final int numeroDeCliquesNoLigarOuWhatsApp;
  final DateTime dataVencimentoPlano;
  final DateTime dataAberturaConta;
  final String IdPrestador;

  DataModelDadosPrestador({
  required this.name,
  required this.phone,
  required this.workingHours,
  required this.description,
  required this.profilePicture,
  required this.city,
  required this.roles,
  required this.numeroDeCliquesNoLigarOuWhatsApp,
  required this.dataVencimentoPlano,
  required this.dataAberturaConta,
  required this.IdPrestador,

  }) : super(id: IdPrestador);
}
