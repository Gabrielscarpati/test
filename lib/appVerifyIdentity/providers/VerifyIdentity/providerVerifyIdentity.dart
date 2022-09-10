import 'package:projeto_treinamento/framework/provider.dart';
import 'package:projeto_treinamento/util/resposta_processamento.dart';
import '../../businessModel/businessModelVerifyIdentity.dart';
import '../../dao/daoVerifyIdentity.dart';
import '../../dao/dataModelVerifyIdentity.dart';

class ProviderVerifyIdentity extends Provider<BusinessModelVerifyIdentity> {
  @override
  Future<BusinessModelVerifyIdentity> getBusinessModel(String id) {
    // TODO: implement getBusinessModel
    throw UnimplementedError();
  }

  @override
  Future<List<BusinessModelVerifyIdentity>> getBusinessModels() async {
    List<BusinessModelVerifyIdentity> prestadores = [];

    DaoVerifyIdentity dao = DaoVerifyIdentity();
    List<DataModelVerifyIdentity> dataModelsVerifyIdentity;
    dataModelsVerifyIdentity = await dao.getDataModels();


    dataModelsVerifyIdentity.forEach((element) {
      if(element.identityVerified == 'no') {
        prestadores.add(BusinessModelVerifyIdentity(
          IdPrestador: element.IdPrestador,
          city: element.city,
          dataAberturaConta: element.dataAberturaConta,
          dataVencimentoPlano: element.dataVencimentoPlano,
          description: element.description,
          name: element.name,
          numeroDeCliquesNoLigarOuWhatsApp: element
              .numeroDeCliquesNoLigarOuWhatsApp,
          phone: element.phone,
          profilePicture: element.profilePicture,
          roles: element.roles,
          workingHours: element.workingHours,
          tipoPlanoPrestador: element.tipoPlanoPrestador,
          cliquesNoWhatsApp: element.numeroDeCliquesNoLigarOuWhatsApp,
          cliquesNoPerfil: element.cliquesNoPerfil,
          identityVerified: element.identityVerified,
          brazilianIDPicture: element.brazilianIDPicture,
        ));
      }});

    return prestadores;
  }

  @override
  Future<RespostaProcessamento> removeBusinessModel(
      BusinessModelVerifyIdentity businessModel) {
    // TODO: implement removeBusinessModel
    throw UnimplementedError();
  }

  @override
  Future<RespostaProcessamento> saveBusinessModel(
      BusinessModelVerifyIdentity businessModel) {
    // TODO: implement saveBusinessModel
    throw UnimplementedError();
  }
}
