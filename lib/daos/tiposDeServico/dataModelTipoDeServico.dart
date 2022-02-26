import 'package:projeto_treinamento/daos/icone/dataModelIcone.dart';
import 'package:projeto_treinamento/framework/dataModel.dart';

class DataModelTipoDeServico extends DataModel {
  final int codTipoServico;
  final String descricao;
  final DataModelIcone icone;
  final int qtdePrestadoresDeServico;

  DataModelTipoDeServico({
    required this.codTipoServico,
    required this.descricao,
    required this.icone,
    required this.qtdePrestadoresDeServico,
  }) : super(id: codTipoServico.toString());
}
