import 'package:projeto_treinamento/framework/businessModel.dart';
import 'package:projeto_treinamento/framework/mixInDescricao.dart';

class BusinessModelVerifyIdentity extends BusinessModel with MixInDescricao {
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
  final int cliquesNoWhatsApp;
  final int cliquesNoPerfil;
  final String identityVerified;
  final String brazilianIDPicture;

  BusinessModelVerifyIdentity({
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
    required this.cliquesNoWhatsApp,
    required this.cliquesNoPerfil,
    required this.identityVerified,
    required this.brazilianIDPicture,
  }) : super(id: IdPrestador);

  factory BusinessModelVerifyIdentity.vazio() => BusinessModelVerifyIdentity(
        name: '',
        phone: '',
        roles: [],
        description: '',
        workingHours: '',
        city: [],
        dataAberturaConta: DateTime.now(),
        IdPrestador: '',
        dataVencimentoPlano: DateTime.now(),
        numeroDeCliquesNoLigarOuWhatsApp: 0,
        profilePicture: '',
        tipoPlanoPrestador: 10,
        cliquesNoWhatsApp: 0,
    cliquesNoPerfil: 0,
    identityVerified: '', brazilianIDPicture: '',
      );

  String primeiroNome() {
    return name.split(' ')[0];
  }

  @override
  String getDescricao() {
    return this.name;
  }
}
