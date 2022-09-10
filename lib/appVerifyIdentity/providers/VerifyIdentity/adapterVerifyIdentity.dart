import 'package:projeto_treinamento/framework/adapter.dart';

import '../../businessModel/businessModelVerifyIdentity.dart';
import '../../dao/dataModelVerifyIdentity.dart';

class AdapterVerifyIdentity
    extends Adapter<BusinessModelVerifyIdentity, DataModelVerifyIdentity> {
  @override
  Future<BusinessModelVerifyIdentity> createBusinessModel(
      DataModelVerifyIdentity? dataModel) async {
    if (dataModel == null)
      return BusinessModelVerifyIdentity.vazio();
    else
      return BusinessModelVerifyIdentity(
        IdPrestador: dataModel.IdPrestador,
        phone: dataModel.phone,
        city: dataModel.city as List<String>,
        description: dataModel.description,
        roles: dataModel.roles as List<int>,
        workingHours: dataModel.workingHours,
        name: dataModel.name,
        dataAberturaConta: dataModel.dataAberturaConta,
        dataVencimentoPlano: dataModel.dataVencimentoPlano,
        numeroDeCliquesNoLigarOuWhatsApp: dataModel.numeroDeCliquesNoLigarOuWhatsApp,
        profilePicture: dataModel.name,
        tipoPlanoPrestador: dataModel.tipoPlanoPrestador,
        cliquesNoWhatsApp: dataModel.numeroDeCliquesNoLigarOuWhatsApp,
        cliquesNoPerfil: dataModel.cliquesNoPerfil,
          identityVerified: dataModel.identityVerified,
        brazilianIDPicture: dataModel.brazilianIDPicture,
      );
  }

  @override
  Future<DataModelVerifyIdentity> createDataModel(
      BusinessModelVerifyIdentity businessModel) async {
    return DataModelVerifyIdentity(
      phone: businessModel.phone,
      city: businessModel.city,
      description: businessModel.description,
      roles: businessModel.roles,
      workingHours: businessModel.workingHours,
      name: businessModel.name,
      profilePicture: businessModel.profilePicture,
      IdPrestador: businessModel.IdPrestador,
      dataAberturaConta: businessModel.dataAberturaConta,
      dataVencimentoPlano: businessModel.dataVencimentoPlano,
      numeroDeCliquesNoLigarOuWhatsApp: businessModel.numeroDeCliquesNoLigarOuWhatsApp,
      tipoPlanoPrestador: businessModel.tipoPlanoPrestador,
      cliquesNoPerfil: businessModel.cliquesNoPerfil,
      identityVerified: businessModel.identityVerified,
      brazilianIDPicture: businessModel.brazilianIDPicture,
    );
  }
}
