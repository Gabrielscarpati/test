import 'package:projeto_treinamento/framework/businessModel.dart';
import 'package:projeto_treinamento/framework/mixInDescricao.dart';

class BusinessModelUsuario extends BusinessModel with MixInDescricao {
  final String email;
  final String nome;

  BusinessModelUsuario({
    required this.email,
    required this.nome,

  }) : super(id: email);

  factory BusinessModelUsuario.vazio() => BusinessModelUsuario(email: "", nome: "",);

  String primeiroNome() {
    return nome.split(' ')[0];
  }

  @override
  String getDescricao() {
    return this.nome;
  }

}
