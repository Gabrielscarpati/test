import 'package:projeto_treinamento/daos/dadosPrestador/daoDadosPrestador.dart';
import 'package:projeto_treinamento/daos/dadosPrestador/dataModelDadosPrestador.dart';
import 'package:projeto_treinamento/framework/provider.dart';
import 'package:projeto_treinamento/framework/providerDireto.dart';
import 'package:projeto_treinamento/util/resposta_processamento.dart';
import '../../businessModels/businessModelDadosPrestador.dart';
import '../../businessModels/businessModelPrestadorInfomation.dart';
import 'adapterDadosPrestador.dart';

class ProvideDadosPrestador extends Provider<BusinessModelDadosPrestador> {
  @override
  Future<BusinessModelDadosPrestador> getBusinessModel(String id) {
    // TODO: implement getBusinessModel
    throw UnimplementedError();
  }

  @override
  Future<List<BusinessModelDadosPrestador>> getBusinessModels() async {
    List<BusinessModelDadosPrestador> prestadores = [];

    DaoDadosPrestador dao = DaoDadosPrestador();
    List<DataModelDadosPrestador> dataModelsPrestadores;
    dataModelsPrestadores = await dao.getDataModels();


    dataModelsPrestadores.forEach((element) {
      prestadores.add(BusinessModelDadosPrestador(
          IdPrestador: element.IdPrestador,
          city: element.city,
          dataAberturaConta: element.dataAberturaConta,
          dataVencimentoPlano: element.dataVencimentoPlano,
          description: element.description,
          name: element.name,
          numeroDeCliquesNoLigarOuWhatsApp: element.numeroDeCliquesNoLigarOuWhatsApp,
          phone: element.phone,
          profilePicture: element.profilePicture,
          roles: element.roles,
          workingHours: element.workingHours,
        tipoPlanoPrestador: element.tipoPlanoPrestador,
        cliquesNoWhatsApp: element.numeroDeCliquesNoLigarOuWhatsApp,
        cliquesNoPerfil: element.cliquesNoPerfil,
      ));
    });

    return prestadores;
  }

  @override
  Future<RespostaProcessamento> removeBusinessModel(
      BusinessModelDadosPrestador businessModel) {
    // TODO: implement removeBusinessModel
    throw UnimplementedError();
  }

  @override
  Future<RespostaProcessamento> saveBusinessModel(
      BusinessModelDadosPrestador businessModel) {
    // TODO: implement saveBusinessModel
    throw UnimplementedError();
  }
}
