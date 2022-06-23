import 'package:projeto_treinamento/businessModels/businessModelAvaliacaoPrestadorDeServico.dart';
import 'package:projeto_treinamento/daos/avaliacaoPrestadorDeServico/dataModelAvaliacaoPrestadorDeServico.dart';
import 'package:projeto_treinamento/framework/adapter.dart';

class AdapterAvaliacaoPrestadorDeServico extends Adapter<BusinessModelAvaliacaoPrestadorDeServico, DataModelAvaliacaoPrestadorDeServico> {
  @override
  Future<BusinessModelAvaliacaoPrestadorDeServico> createBusinessModel(DataModelAvaliacaoPrestadorDeServico? dataModel) async {
    if (dataModel == null)
      return BusinessModelAvaliacaoPrestadorDeServico.vazio();
    else {
      return BusinessModelAvaliacaoPrestadorDeServico(
        idUsuario: dataModel.idUsuario,
        codPrestadorDeServico: dataModel.codPrestadorDeServico,
        nota: dataModel.nota,
        comentario: dataModel.comentario,
        data: dataModel.data,
        emailUsuario: dataModel.emailUsuario,
      );
    }
  }

  @override
  Future<DataModelAvaliacaoPrestadorDeServico> createDataModel(BusinessModelAvaliacaoPrestadorDeServico businessModel) async {
    return DataModelAvaliacaoPrestadorDeServico(
      idUsuario: businessModel.idUsuario,
      codPrestadorDeServico: businessModel.codPrestadorDeServico,
      nota: businessModel.nota,
      comentario: businessModel.comentario,
      data: businessModel.data,
        emailUsuario: businessModel.emailUsuario,
    );
  }
}
