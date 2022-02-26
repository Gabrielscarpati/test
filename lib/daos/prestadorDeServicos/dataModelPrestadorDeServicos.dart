import 'package:projeto_treinamento/framework/dataModel.dart';

class DataModelPrestadorDeServicos extends DataModel {
  final int codPrestadorServico;
  final String nome;
  final String telefone;
  final String urlFoto;
  final double nota;
  final int totalDeAvaliacoes;
  final int totalDeAvaliacoesNota1;
  final int totalDeAvaliacoesNota2;
  final int totalDeAvaliacoesNota3;
  final int totalDeAvaliacoesNota4;
  final int totalDeAvaliacoesNota5;

  DataModelPrestadorDeServicos({
    required this.codPrestadorServico,
    required this.nome,
    required this.telefone,
    required this.urlFoto,
    required this.nota,
    required this.totalDeAvaliacoes,
    required this.totalDeAvaliacoesNota1,
    required this.totalDeAvaliacoesNota2,
    required this.totalDeAvaliacoesNota3,
    required this.totalDeAvaliacoesNota4,
    required this.totalDeAvaliacoesNota5,
  }) : super(id: codPrestadorServico.toString());
}
