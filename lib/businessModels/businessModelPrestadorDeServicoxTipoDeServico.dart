import 'package:projeto_treinamento/framework/businessModel.dart';

class BusinessModelPrestadorDeServicoXTipoDeServico extends BusinessModel {
  final int codPrestadorDeServico;
  final int codTipoDeServico;

  BusinessModelPrestadorDeServicoXTipoDeServico({
    required this.codPrestadorDeServico,
    required this.codTipoDeServico,
  }) : super(id: codPrestadorDeServico.toString() + "-" + codTipoDeServico.toString());

  factory BusinessModelPrestadorDeServicoXTipoDeServico.vazio() => BusinessModelPrestadorDeServicoXTipoDeServico(codPrestadorDeServico: 0, codTipoDeServico: 0);
}
