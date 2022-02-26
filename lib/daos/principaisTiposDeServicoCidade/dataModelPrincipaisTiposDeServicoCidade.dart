import 'package:projeto_treinamento/daos/cidade/dataModelCidade.dart';
import 'package:projeto_treinamento/daos/tiposDeServico/dataModelTipoDeServico.dart';
import 'package:projeto_treinamento/framework/dataModel.dart';

class DataModelPrincipaisTiposDeServicoCidade extends DataModel {
  final DataModelCidade cidade;
  final List<DataModelTipoDeServico> tiposDeServico;

  DataModelPrincipaisTiposDeServicoCidade({
    required this.cidade,
    required this.tiposDeServico,
  }) : super(id: cidade.codCidade.toString());
}
