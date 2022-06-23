import 'package:projeto_treinamento/framework/businessModel.dart';

class BusinessModelAvaliacaoPrestadorDeServico extends BusinessModel {
  final String idUsuario;
  final String codPrestadorDeServico;
  final int nota;
  final String comentario;
  final String data;
  final String emailUsuario;


  BusinessModelAvaliacaoPrestadorDeServico({
    required this.idUsuario,
    required this.codPrestadorDeServico,
    required this.nota,
    required this.comentario,
    required this.data,
    required this.emailUsuario,
  }) : super(id: idUsuario + "-" + codPrestadorDeServico.toString());

  factory BusinessModelAvaliacaoPrestadorDeServico.vazio() => BusinessModelAvaliacaoPrestadorDeServico(
        idUsuario: "",
        codPrestadorDeServico: '0',
        nota: 0,
        comentario: "",
        data: "",
    emailUsuario: '',
      );
}
