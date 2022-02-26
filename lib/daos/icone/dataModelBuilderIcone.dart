import 'package:projeto_treinamento/framework/dataModelBuilder.dart';

import 'dataModelIcone.dart';

class DataModelBuilderIcone extends DataModelBuilder<DataModelIcone> {
  @override
  DataModelIcone? createDataModel(Map<String, dynamic> json) {
    return DataModelIcone(
      id: "",
      codePoint: int.parse(json["codePoint"]),
      fontFamily: json["fontFamily"],
      fontPackage: json["fontPackage"] == '' ? null : json["fontPackage"],
    );
  }

  @override
  Map<String, dynamic>? createJson(DataModelIcone? dataModel) {
    if (dataModel == null) return null;
    return {
      "codePoint": dataModel.codePoint,
      "fontFamily": dataModel.fontFamily,
      "fontPackage": dataModel.fontPackage,
    };
  }
}
