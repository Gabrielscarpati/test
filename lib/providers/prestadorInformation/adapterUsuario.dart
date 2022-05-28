import 'package:projeto_treinamento/businessModels/businessModelUsuario.dart';
import 'package:projeto_treinamento/daos/usuario/dataModelUsuario.dart';
import 'package:projeto_treinamento/framework/adapter.dart';

class AdapterUsuario extends Adapter<BusinessModelUsuario, DataModelUsuario> {
  @override
  Future<BusinessModelUsuario> createBusinessModel(DataModelUsuario? dataModel) async {
    if (dataModel == null)
      return BusinessModelUsuario.vazio();
    else
      return BusinessModelUsuario(
        email: dataModel.email,
        nome: dataModel.nome,
        urlFoto: dataModel.urlFoto,
        phone: dataModel.phone,
        city: dataModel.city,
        description: dataModel.description,
        roles: dataModel.roles,
        workingHours: dataModel.workingHours,
        brazilianID: dataModel.brazilianID,
        brazilianIDpicture: dataModel.brazilianIDpicture,
      );
  }

  @override
  Future<DataModelUsuario> createDataModel(BusinessModelUsuario businessModel) async {
    return DataModelUsuario(
      email: businessModel.email,
      nome: businessModel.nome,
      urlFoto: businessModel.urlFoto,
      phone: businessModel.phone,
      city: businessModel.city,
      description: businessModel.description,
      roles: businessModel.roles,
      workingHours: businessModel.workingHours,
      brazilianID: businessModel.brazilianID,
      brazilianIDpicture: businessModel.brazilianIDpicture,


    );
  }
}
