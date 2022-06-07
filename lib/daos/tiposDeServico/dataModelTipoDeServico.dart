import 'package:projeto_treinamento/daos/icone/dataModelIcone.dart';
import 'package:projeto_treinamento/framework/dataModel.dart';

class DataModelTipoDeServico extends DataModel {
  final int codTipoServico;
  final String descricao;

  DataModelTipoDeServico({
    required this.codTipoServico,
    required this.descricao,
  }) : super(id: codTipoServico.toString());
}
