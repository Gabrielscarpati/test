import 'package:projeto_treinamento/framework/dataModel.dart';

class DataModelPrestadorDeServicos extends DataModel {
  final String codPrestadorServico;
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
  final int tipoPlanoPrestador;
  final List<String> cidades;
  final List<int> servicos;
  final String workingHours;
  final int cliquesNoPerfil;
  final int cliquesNoWhatsApp;


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
    required this.tipoPlanoPrestador,
    required this.cidades,
    required this.servicos,
    required this.workingHours,
    required this.cliquesNoPerfil,
    required this.cliquesNoWhatsApp,
  }) : super(id: codPrestadorServico.toString());
}
