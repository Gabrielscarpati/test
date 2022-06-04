import 'package:projeto_treinamento/framework/dataModelBuilder.dart';

import 'dataModelUsuario.dart';

class DataModelBuilderUsuario extends DataModelBuilder<DataModelUsuario> {
  @override
  DataModelUsuario? createDataModel(Map<String, dynamic> json) {
    return DataModelUsuario(
      email: json["email"],
      nome: json["nome"],

    );
  }

  @override
  Map<String, dynamic>? createJson(DataModelUsuario? dataModel) {
    if (dataModel == null) return null;
    return {"email": dataModel.email, "nome": dataModel.nome,};
  }
}
