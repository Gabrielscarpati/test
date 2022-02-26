import 'package:projeto_treinamento/framework/dataModel.dart';

class DataModelAvaliacaoPrestadorDeServico extends DataModel {
  final String idUsuario;
  final int codPrestadorDeServico;
  final double nota;
  final String comentario;
  final String data;

  DataModelAvaliacaoPrestadorDeServico({
    required this.idUsuario,
    required this.codPrestadorDeServico,
    required this.nota,
    required this.comentario,
    required this.data,
  }) : super(id: idUsuario + "-" + codPrestadorDeServico.toString());
}
