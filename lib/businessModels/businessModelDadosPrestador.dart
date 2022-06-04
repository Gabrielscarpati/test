import 'package:projeto_treinamento/framework/businessModel.dart';
import 'package:projeto_treinamento/framework/mixInDescricao.dart';

class BusinessModelDadosPrestador extends BusinessModel
    with MixInDescricao {
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
  }) : super(id: IdPrestador);

  factory BusinessModelDadosPrestador.vazio() =>
      BusinessModelDadosPrestador(
        name: '',
        phone: '',
        roles: '',
        description: '',
        workingHours: '',
        city: '', 
        dataAberturaConta: DateTime.now(),
        IdPrestador: '',
        dataVencimentoPlano: DateTime.now(),
        numeroDeCliquesNoLigarOuWhatsApp: 0,
        profilePicture: '',        
      );

  String primeiroNome() {
    return name.split(' ')[0];
  }

  @override
  String getDescricao() {
    return this.name;
  }
}
