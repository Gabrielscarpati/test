import 'package:projeto_treinamento/framework/businessModel.dart';

class BusinessModelPrestadorDeServicoXCidade extends BusinessModel {
  final int codPrestadorDeServico;
  final int codCidade;

  BusinessModelPrestadorDeServicoXCidade({
    required this.codPrestadorDeServico,
    required this.codCidade,
  }) : super(id: codPrestadorDeServico.toString() + "-" + codCidade.toString());

  factory BusinessModelPrestadorDeServicoXCidade.vazio() => BusinessModelPrestadorDeServicoXCidade(codPrestadorDeServico: 0, codCidade: 0);
}
