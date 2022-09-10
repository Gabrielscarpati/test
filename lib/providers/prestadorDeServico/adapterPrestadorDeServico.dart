import 'package:projeto_treinamento/businessModels/businessModelPrestadorDeServicos.dart';
import 'package:projeto_treinamento/daos/prestadorDeServicos/dataModelPrestadorDeServicos.dart';
import 'package:projeto_treinamento/daos/statusPrestadorDeServicos/daoStatusPrestadorDeServicos.dart';
import 'package:projeto_treinamento/daos/statusPrestadorDeServicos/dataModelStatusPrestadorDeServicos.dart';
import 'package:projeto_treinamento/framework/adapter.dart';

class AdapterPrestadorDeServico extends Adapter<BusinessModelPrestadorDeServicos, DataModelPrestadorDeServicos> {
  Future<BusinessModelPrestadorDeServicos> createBusinessModel(DataModelPrestadorDeServicos? dataModelPrestadorDeServicos) async {
    if (dataModelPrestadorDeServicos == null) {
      return BusinessModelPrestadorDeServicos.vazio();
    }

    List<DataModelStatusPrestadorDeServicos> listaDataModelStatusPrestadorDeServicos = List.empty(growable: true);
    DataModelStatusPrestadorDeServicos? dataModelStatusPrestadorDeServicosWhatsApp = await DaoStatusPrestadorDeServicos().getDataModel(dataModelPrestadorDeServicos.telefone);
    if (dataModelStatusPrestadorDeServicosWhatsApp != null) listaDataModelStatusPrestadorDeServicos.add(dataModelStatusPrestadorDeServicosWhatsApp);
    DataModelStatusPrestadorDeServicos? dataModelStatusPrestadorDeServicos;
    listaDataModelStatusPrestadorDeServicos.forEach((dataModel) {
      if (dataModelStatusPrestadorDeServicos == null)
        dataModelStatusPrestadorDeServicos = dataModel;
      else if (dataModel.onLine) dataModelStatusPrestadorDeServicos = dataModel;
    });

    return BusinessModelPrestadorDeServicos(
      codPrestadorServico: dataModelPrestadorDeServicos.codPrestadorServico,
      nome: dataModelPrestadorDeServicos.nome,
      telefone: dataModelPrestadorDeServicos.telefone,
      urlFoto: dataModelPrestadorDeServicos.urlFoto,
      statusOnline: dataModelStatusPrestadorDeServicos != null ? dataModelStatusPrestadorDeServicos!.onLine : false,
      nota: dataModelPrestadorDeServicos.nota,
      totalDeAvaliacoes: dataModelPrestadorDeServicos.totalDeAvaliacoes,
      totalDeAvaliacoesNota1: dataModelPrestadorDeServicos.totalDeAvaliacoesNota1,
      totalDeAvaliacoesNota2: dataModelPrestadorDeServicos.totalDeAvaliacoesNota2,
      totalDeAvaliacoesNota3: dataModelPrestadorDeServicos.totalDeAvaliacoesNota3,
      totalDeAvaliacoesNota4: dataModelPrestadorDeServicos.totalDeAvaliacoesNota4,
      totalDeAvaliacoesNota5: dataModelPrestadorDeServicos.totalDeAvaliacoesNota5,
      description: dataModelPrestadorDeServicos.urlFoto,
      tipoPlanoPrestador: dataModelPrestadorDeServicos.tipoPlanoPrestador,
      cidades: dataModelPrestadorDeServicos.cidades,
      servicos: dataModelPrestadorDeServicos.servicos,
      workingHours: dataModelPrestadorDeServicos.workingHours,
      cliquesNoPerfil: dataModelPrestadorDeServicos.cliquesNoPerfil,
      cliquesNoWhatsApp: dataModelPrestadorDeServicos.cliquesNoWhatsApp,
    );
  }

  @override
  Future<DataModelPrestadorDeServicos> createDataModel(BusinessModelPrestadorDeServicos businessModel) async {
    return DataModelPrestadorDeServicos(
      codPrestadorServico: businessModel.codPrestadorServico,
      nome: businessModel.nome,
      telefone: businessModel.telefone,
      urlFoto: businessModel.urlFoto,
      nota: businessModel.nota,
      totalDeAvaliacoes: businessModel.totalDeAvaliacoes,
      totalDeAvaliacoesNota1: businessModel.totalDeAvaliacoesNota1,
      totalDeAvaliacoesNota2: businessModel.totalDeAvaliacoesNota2,
      totalDeAvaliacoesNota3: businessModel.totalDeAvaliacoesNota3,
      totalDeAvaliacoesNota4: businessModel.totalDeAvaliacoesNota4,
      totalDeAvaliacoesNota5: businessModel.totalDeAvaliacoesNota5,
        tipoPlanoPrestador: businessModel.tipoPlanoPrestador,
      cidades: businessModel.cidades,
      servicos: businessModel.servicos,
      workingHours: businessModel.workingHours,
      cliquesNoPerfil: businessModel.cliquesNoPerfil,
      cliquesNoWhatsApp: businessModel.cliquesNoWhatsApp,
    );
  }
}


