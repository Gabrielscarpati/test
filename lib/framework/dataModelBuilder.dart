import 'dataModel.dart';

abstract class DataModelBuilder<DM extends DataModel> {
  DM? createDataModel(Map<String, dynamic> json);

  Map<String, dynamic>? createJson(DM? dataModel);
}
