import 'package:projeto_treinamento/framework/dataModelBuilder.dart';
import 'package:projeto_treinamento/util/dateTimeUtils.dart';

import 'dataModelAvaliacaoPrestadorDeServico.dart';

class DataModelBuilderAvaliacaoPrestadorDeServicos extends DataModelBuilder<DataModelAvaliacaoPrestadorDeServico> {
  @override
  DataModelAvaliacaoPrestadorDeServico? createDataModel(Map<String, dynamic> json) {
    return DataModelAvaliacaoPrestadorDeServico(
      idUsuario: json["idUsuario"],
      codPrestadorDeServico: json["codPrestadorServico"],
      nota: json["nota"].toDouble(),
      comentario: json["comentario"],
      data: formataDataDDMMYYYY(DateTime.parse(json["data"])),
    );
  }

  @override
  Map<String, dynamic>? createJson(DataModelAvaliacaoPrestadorDeServico? dataModel) {
    return null;
    /*
    if (dataModel == null) return null;
    return {
      "codPrestadorServico": dataModel.codPrestadorServico,
      "nome": dataModel.nome,
      "telefone": dataModel.telefone,
      "urlFoto": dataModel.urlFoto,
      "nota": dataModel.nota,
      "totalDeAvaliacoes": dataModel.totalDeAvaliacoes,
    };
     */
  }
}
