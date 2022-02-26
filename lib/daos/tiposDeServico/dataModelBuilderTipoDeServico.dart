import 'package:projeto_treinamento/daos/icone/dataModelBuilderIcone.dart';
import 'package:projeto_treinamento/daos/tiposDeServico/dataModelTipoDeServico.dart';
import 'package:projeto_treinamento/framework/dataModelBuilder.dart';

class DataModelBuilderTipoDeServico extends DataModelBuilder<DataModelTipoDeServico> {
  @override
  DataModelTipoDeServico? createDataModel(Map<String, dynamic> json) {
    return DataModelTipoDeServico(
      codTipoServico: json["codTipoServico"],
      descricao: json["descricao"],
      icone: DataModelBuilderIcone().createDataModel(json["icone"])!,
      qtdePrestadoresDeServico: json["qtdePrestadoresDeServico"] ?? 0,
    );
  }

  @override
  Map<String, dynamic>? createJson(DataModelTipoDeServico? dataModel) {
    if (dataModel == null) return null;
    return {
      "codTipoServico": dataModel.codTipoServico,
      "descricao": dataModel.descricao,
      "icone": DataModelBuilderIcone().createJson(dataModel.icone),
      "qtdePrestadoresDeServico": dataModel.qtdePrestadoresDeServico,
    };
  }
}
