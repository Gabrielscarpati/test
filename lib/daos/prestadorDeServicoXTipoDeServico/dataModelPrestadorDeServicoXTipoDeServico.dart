import 'package:projeto_treinamento/framework/dataModel.dart';

class DataModelPrestadorDeServicoXTipoDeServico extends DataModel {
  final int codPrestadorDeServico;
  final int codTipoDeServico;

  DataModelPrestadorDeServicoXTipoDeServico({
    required this.codPrestadorDeServico,
    required this.codTipoDeServico,
  }) : super(id: codPrestadorDeServico.toString() + "-" + codTipoDeServico.toString());
}
