import 'package:projeto_treinamento/businessModels/businessModelDDD.dart';
import 'package:projeto_treinamento/daos/ddd/dataModelDDD.dart';
import 'package:projeto_treinamento/framework/adapter.dart';

class AdapterDDD extends Adapter<BusinessModelDDD, DataModelDDD> {
  @override
  Future<BusinessModelDDD> createBusinessModel(DataModelDDD? dataModel) async {
    if (dataModel == null)
      return BusinessModelDDD.vazio();
    else
      return BusinessModelDDD(
        ddd: dataModel.ddd,
        uf: dataModel.uf,
      );
  }

  @override
  Future<DataModelDDD> createDataModel(BusinessModelDDD businessModel) async {
    return DataModelDDD(
      ddd: businessModel.ddd,
      uf: businessModel.uf,
    );
  }
}
