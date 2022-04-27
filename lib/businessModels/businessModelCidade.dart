import 'package:projeto_treinamento/framework/businessModel.dart';
import 'package:projeto_treinamento/framework/mixInDescricao.dart';

class BusinessModelCidade extends BusinessModel with MixInDescricao {
  final int codCidade;
  final String nome;
  final int totalPrestadoresServico;

  BusinessModelCidade({
    required this.codCidade,
    required this.nome,
    required this.totalPrestadoresServico,
  }) : super(id: codCidade.toString());

  factory BusinessModelCidade.vazio() => BusinessModelCidade(codCidade: 0, nome: '', totalPrestadoresServico: 0);

  factory BusinessModelCidade.Todos() => BusinessModelCidade(codCidade: 999999, nome: 'Todos', totalPrestadoresServico: 0);

  String getDescricao() {
    return nome;
  }
}

// model(organizacao de dados), como que a gente quer trabalhar com os dados dentro do codigo. (cara/caracteristicas cidade)