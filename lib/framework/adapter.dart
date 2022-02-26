import 'package:projeto_treinamento/framework/businessModel.dart';
import 'package:projeto_treinamento/framework/dataModel.dart';

abstract class Adapter<BM extends BusinessModel, DM extends DataModel> {
  Future<BM> createBusinessModel(DM? dataModel);

  Future<DM> createDataModel(BM businessModel);
}
