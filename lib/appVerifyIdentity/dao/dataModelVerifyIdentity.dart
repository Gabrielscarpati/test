import 'package:projeto_treinamento/framework/dataModel.dart';

class DataModelVerifyIdentity extends DataModel {
  final String name;
  final String phone;
  final String workingHours;
  final String description;
  final String profilePicture;
  final List<String> city;
  final List<int> roles;
  final int numeroDeCliquesNoLigarOuWhatsApp;
  final DateTime dataVencimentoPlano;
  final DateTime dataAberturaConta;
  final String IdPrestador;
  final int tipoPlanoPrestador;
  final int cliquesNoPerfil;
  final String identityVerified;
  final String brazilianIDPicture;

  DataModelVerifyIdentity({
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
    required this.tipoPlanoPrestador,
    required this.cliquesNoPerfil,
    required this.identityVerified,
    required this.brazilianIDPicture,
  }) : super(id: IdPrestador);
}
