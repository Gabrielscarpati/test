import 'package:projeto_treinamento/framework/dataModel.dart';

class DataModelAvaliacaoPrestadorDeServico extends DataModel {
  final String idUsuario;
  final String codPrestadorDeServico;
  final int nota;
  final String comentario;
  final String data;
  final String emailUsuario;

  DataModelAvaliacaoPrestadorDeServico({
    required this.idUsuario,
    required this.codPrestadorDeServico,
    required this.nota,
    required this.comentario,
    required this.data,
    required this.emailUsuario,
  }) : super(id: idUsuario + "-" + codPrestadorDeServico.toString());
}
