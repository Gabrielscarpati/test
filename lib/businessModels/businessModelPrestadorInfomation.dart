import 'package:projeto_treinamento/framework/businessModel.dart';
import 'package:projeto_treinamento/framework/mixInDescricao.dart';

class BusinessModelPrestadorInformation extends BusinessModel
    with MixInDescricao {
  final String IdUsuario;
  final String nome;
  final String phone;
  final String city;
  final String description;
  final String roles;
  final String workingHours;

  BusinessModelPrestadorInformation({
    required this.IdUsuario,
    required this.nome,
    required this.phone,
    required this.city,
    required this.description,
    required this.roles,
    required this.workingHours,
  }) : super(id: IdUsuario);

  factory BusinessModelPrestadorInformation.vazio() =>
      BusinessModelPrestadorInformation(
        IdUsuario: "",
        nome: "",
        phone: '',
        roles: '',
        description: '',
        workingHours: '',
        city: '',
      );

  String primeiroNome() {
    return nome.split(' ')[0];
  }

  @override
  String getDescricao() {
    return this.nome;
  }
}
