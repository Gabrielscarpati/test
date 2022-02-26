import 'package:projeto_treinamento/framework/dataModel.dart';

class DataModelPrestadorDeServicoXCidade extends DataModel {
  final int codPrestadorDeServico;
  final int codCidade;

  DataModelPrestadorDeServicoXCidade({
    required this.codPrestadorDeServico,
    required this.codCidade,
  }) : super(id: codPrestadorDeServico.toString() + "-" + codCidade.toString());
}
