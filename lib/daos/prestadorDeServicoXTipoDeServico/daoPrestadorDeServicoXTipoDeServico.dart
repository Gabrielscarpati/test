import 'package:projeto_treinamento/framework/daoPadrao.dart';
import 'package:projeto_treinamento/util/resposta_processamento.dart';

import 'dataModelPrestadorDeServicoXTipoDeServico.dart';

class DaoPrestadorDeServicoXTipoDeServico extends DaoPadrao<DataModelPrestadorDeServicoXTipoDeServico> {
  DaoPrestadorDeServicoXTipoDeServico() : super(dados: _dados);

  List<DataModelPrestadorDeServicoXTipoDeServico> getDataModelsByPrestadorDeServico(int codPrestadorDeServico) {
    List<DataModelPrestadorDeServicoXTipoDeServico> lista = List.empty(growable: true);
    for (int i = 0; i < _dados.length; i++) {
      DataModelPrestadorDeServicoXTipoDeServico dataModel = _dados[i];
      if (codPrestadorDeServico == dataModel.codPrestadorDeServico) lista.add(dataModel);
    }
    return lista;
  }

  List<DataModelPrestadorDeServicoXTipoDeServico> getDataModelsByTipoDeServico(int codTipoDeServico) {
    List<DataModelPrestadorDeServicoXTipoDeServico> lista = List.empty(growable: true);
    for (int i = 0; i < _dados.length; i++) {
      DataModelPrestadorDeServicoXTipoDeServico dataModel = _dados[i];
      if (codTipoDeServico == dataModel.codTipoDeServico) lista.add(dataModel);
    }
    return lista;
  }

  Future<RespostaProcessamento> saveDataModelsByPrestadorDeServico(
    int codPrestadorDeServico,
    List<DataModelPrestadorDeServicoXTipoDeServico> dataModels,
  ) async {
    _dados.removeWhere((dataModel) => (codPrestadorDeServico == dataModel.codPrestadorDeServico));
    _dados.addAll(dataModels);
    return RespostaProcessamento.ok();
  }

  int getQuantidadePrestadoresTipoDeServico(int codTipoDeServico, String cidade) {
    return getDataModelsByTipoDeServico(codTipoDeServico).length;
  }

  static List<DataModelPrestadorDeServicoXTipoDeServico> _dados = List.empty(growable: true)..add(DataModelPrestadorDeServicoXTipoDeServico(codPrestadorDeServico: 10, codTipoDeServico: 5))..add(DataModelPrestadorDeServicoXTipoDeServico(codPrestadorDeServico: 20, codTipoDeServico: 6))..add(DataModelPrestadorDeServicoXTipoDeServico(codPrestadorDeServico: 20, codTipoDeServico: 7))..add(DataModelPrestadorDeServicoXTipoDeServico(codPrestadorDeServico: 30, codTipoDeServico: 1))..add(DataModelPrestadorDeServicoXTipoDeServico(codPrestadorDeServico: 40, codTipoDeServico: 5))..add(DataModelPrestadorDeServicoXTipoDeServico(codPrestadorDeServico: 50, codTipoDeServico: 1))..add(DataModelPrestadorDeServicoXTipoDeServico(codPrestadorDeServico: 60, codTipoDeServico: 2))..add(DataModelPrestadorDeServicoXTipoDeServico(codPrestadorDeServico: 70, codTipoDeServico: 7));
}
