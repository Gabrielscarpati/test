import 'package:projeto_treinamento/framework/dataModelBuilder.dart';

import 'dataModelCidade.dart';

class DataModelBuilderCidade extends DataModelBuilder<DataModelCidade> {
  @override
  DataModelCidade? createDataModel(Map<String, dynamic> json) {
    return DataModelCidade(
      codCidade: json["codCidade"],
      nome: json["nome"],
      totalPrestadoresServico: json["totalPrestadoresServico"],
    );
  }

  @override
  Map<String, dynamic>? createJson(DataModelCidade? dataModel) {
    if (dataModel == null) return null;
    return {"codCidade": dataModel.codCidade, "nome": dataModel.nome, "totalPrestadoresServico": dataModel.totalPrestadoresServico};
  }
}

/*
converter, json => objeto vice versa.
 */