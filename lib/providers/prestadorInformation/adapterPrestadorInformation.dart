import 'package:projeto_treinamento/daos/prestadorInformation/dataModePrestadorInformation.dart';
import 'package:projeto_treinamento/framework/adapter.dart';

import '../../businessModels/businessModelPrestadorInfomation.dart';

class AdapterPrestadorInformation extends Adapter<
    BusinessModelPrestadorInformation, DataModelPrestadorInformation> {
  @override
  Future<BusinessModelPrestadorInformation> createBusinessModel(
      DataModelPrestadorInformation? dataModel) async {
    if (dataModel == null)
      return BusinessModelPrestadorInformation.vazio();
    else
      return BusinessModelPrestadorInformation(
        IdUsuario: dataModel.IdUsuario,
        phone: dataModel.phone,
        city: dataModel.city,
        description: dataModel.description,
        roles: dataModel.roles,
        workingHours: dataModel.workingHours,
        nome: '',
      );
  }

  @override
  Future<DataModelPrestadorInformation> createDataModel(
      BusinessModelPrestadorInformation businessModel) async {
    return DataModelPrestadorInformation(
      phone: businessModel.phone,
      city: businessModel.city,
      description: businessModel.description,
      roles: businessModel.roles,
      workingHours: businessModel.workingHours,
      brazilianID: '',
      brazilianIDPicture: '',
      IdUsuario: businessModel.IdUsuario,
      name: '',
      profilePicture: '',
    );
  }
}
