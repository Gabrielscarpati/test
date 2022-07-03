import 'package:projeto_treinamento/framework/businessModel.dart';
import 'package:projeto_treinamento/framework/mixInDescricao.dart';

class BusinessModelDadosPrestador extends BusinessModel with MixInDescricao {
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

  BusinessModelDadosPrestador({
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
  }) : super(id: IdPrestador);

  factory BusinessModelDadosPrestador.vazio() => BusinessModelDadosPrestador(
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
      );

  String primeiroNome() {
    return name.split(' ')[0];
  }

  @override
  String getDescricao() {
    return this.name;
  }
}
