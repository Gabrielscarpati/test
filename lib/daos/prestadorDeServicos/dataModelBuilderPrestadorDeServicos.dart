import 'package:projeto_treinamento/framework/dataModelBuilder.dart';

import 'dataModelPrestadorDeServicos.dart';

class DataModelBuilderPrestadorDeServicos extends DataModelBuilder<DataModelPrestadorDeServicos> {
  @override
  DataModelPrestadorDeServicos? createDataModel(Map<String, dynamic> json) {
    return DataModelPrestadorDeServicos(
      codPrestadorServico: json["codPrestadorServico"],
      nome: json["nome"],
      telefone: json["telefone"],
      urlFoto: json["urlFoto"],
      nota: double.parse(json["nota"].toString()),
      totalDeAvaliacoes: json["totalDeAvaliacoes"],
      totalDeAvaliacoesNota1: json["totalDeAvaliacoesNota1"],
      totalDeAvaliacoesNota2: json["totalDeAvaliacoesNota2"],
      totalDeAvaliacoesNota3: json["totalDeAvaliacoesNota3"],
      totalDeAvaliacoesNota4: json["totalDeAvaliacoesNota4"],
      totalDeAvaliacoesNota5: json["totalDeAvaliacoesNota5"],
    );
  }

  @override
  Map<String, dynamic>? createJson(DataModelPrestadorDeServicos? dataModel) {
    if (dataModel == null) return null;
    return {
      "codPrestadorServico": dataModel.codPrestadorServico,
      "nome": dataModel.nome,
      "telefone": dataModel.telefone,
      "urlFoto": dataModel.urlFoto,
      "nota": dataModel.nota,
      "totalDeAvaliacoes": dataModel.totalDeAvaliacoes,
      "totalDeAvaliacoesNota1": dataModel.totalDeAvaliacoesNota1,
      "totalDeAvaliacoesNota2": dataModel.totalDeAvaliacoesNota2,
      "totalDeAvaliacoesNota3": dataModel.totalDeAvaliacoesNota3,
      "totalDeAvaliacoesNota4": dataModel.totalDeAvaliacoesNota4,
      "totalDeAvaliacoesNota5": dataModel.totalDeAvaliacoesNota5,
    };
  }
}
