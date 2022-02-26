import 'package:projeto_treinamento/framework/businessModel.dart';

class BusinessModelAvaliacaoPrestadorDeServico extends BusinessModel {
  final String idUsuario;
  final int codPrestadorDeServico;
  final double nota;
  final String comentario;
  final String data;

  BusinessModelAvaliacaoPrestadorDeServico({
    required this.idUsuario,
    required this.codPrestadorDeServico,
    required this.nota,
    required this.comentario,
    required this.data,
  }) : super(id: idUsuario + "-" + codPrestadorDeServico.toString());

  factory BusinessModelAvaliacaoPrestadorDeServico.vazio() => BusinessModelAvaliacaoPrestadorDeServico(
        idUsuario: "",
        codPrestadorDeServico: 0,
        nota: 0,
        comentario: "",
        data: "",
      );
}
