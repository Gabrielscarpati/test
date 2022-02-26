import 'package:projeto_treinamento/daos/cidade/dataModelBuilderCidade.dart';
import 'package:projeto_treinamento/daos/principaisTiposDeServicoCidade/dataModelPrincipaisTiposDeServicoCidade.dart';
import 'package:projeto_treinamento/daos/tiposDeServico/dataModelBuilderTipoDeServico.dart';
import 'package:projeto_treinamento/daos/tiposDeServico/dataModelTipoDeServico.dart';
import 'package:projeto_treinamento/framework/dataModelBuilder.dart';

class DataModelBuilderPrincipaisTipoDeServicoCidade extends DataModelBuilder<DataModelPrincipaisTiposDeServicoCidade> {
  @override
  DataModelPrincipaisTiposDeServicoCidade? createDataModel(Map<String, dynamic> json) {
    return DataModelPrincipaisTiposDeServicoCidade(
      cidade: DataModelBuilderCidade().createDataModel(json["cidade"])!,
      tiposDeServico: _getTiposDeServicoFromJson(json["tiposDeServico"] as List<dynamic>),
    );
  }

  List<DataModelTipoDeServico> _getTiposDeServicoFromJson(List<dynamic> json) {
    List<DataModelTipoDeServico> lista = List.empty(growable: true);
    json.forEach((element) {
      lista.add(DataModelBuilderTipoDeServico().createDataModel(element)!);
    });
    return lista;
  }

  @override
  Map<String, dynamic>? createJson(DataModelPrincipaisTiposDeServicoCidade? dataModel) {
    if (dataModel == null) return null;
    return {
      "cidade": DataModelBuilderCidade().createJson(dataModel.cidade),
      "tiposDeServico": dataModel.tiposDeServico,
    };
  }
}
