import 'package:projeto_treinamento/framework/businessModel.dart';
import 'package:projeto_treinamento/framework/mixInDescricao.dart';

class BusinessModelUsuario extends BusinessModel with MixInDescricao {
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

  BusinessModelUsuario({
    required this.email,
    required this.nome,
    this.urlFoto,
    required this.phone,
    required this.city,
    required this.description,
    required this.roles,
    required this.workingHours,
    required this.brazilianID,
    required this.brazilianIDpicture,
  }) : super(id: email);

  factory BusinessModelUsuario.vazio() => BusinessModelUsuario(email: "", nome: "", phone: '', roles: '', description: '', brazilianIDpicture: '', workingHours: '', city: '', brazilianID: '');

  String primeiroNome() {
    return nome.split(' ')[0];
  }

  @override
  String getDescricao() {
    return this.nome;
  }

}
