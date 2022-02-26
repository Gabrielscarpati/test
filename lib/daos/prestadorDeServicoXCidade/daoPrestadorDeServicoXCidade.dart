import 'package:projeto_treinamento/framework/daoPadrao.dart';

import 'dataModelPrestadorDeServicoXCidade.dart';

class DaoPrestadorDeServicoXCidade extends DaoPadrao<DataModelPrestadorDeServicoXCidade> {
  DaoPrestadorDeServicoXCidade() : super(dados: _dados);

  bool verificaSePrestadorAtendeNaCidade(int codPrestadorDeServico, int codCidade) {
    for (int i = 0; i < _dados.length; i++) {
      DataModelPrestadorDeServicoXCidade dataModel = _dados[i];
      if ((codPrestadorDeServico == dataModel.codPrestadorDeServico) && ((codCidade == dataModel.codCidade) || (codCidade == 999999))) return true;
    }
    return false;
  }

  int getQuantidadePrestadoresCidade(int codCidade) {
    int totalPrestadoresDeServicoNaCidade = 0;
    for (int i = 0; i < _dados.length; i++) {
      DataModelPrestadorDeServicoXCidade dataModel = _dados[i];
      if ((codCidade == dataModel.codCidade) || (codCidade == 999999)) totalPrestadoresDeServicoNaCidade++;
    }
    return totalPrestadoresDeServicoNaCidade;
  }

  static List<DataModelPrestadorDeServicoXCidade> _dados = List.empty(growable: true)
    ..add(DataModelPrestadorDeServicoXCidade(
      codPrestadorDeServico: 10,
      codCidade: 1,
    ))
    ..add(DataModelPrestadorDeServicoXCidade(
      codPrestadorDeServico: 20,
      codCidade: 1,
    ))
    ..add(DataModelPrestadorDeServicoXCidade(
      codPrestadorDeServico: 20,
      codCidade: 1,
    ))
    ..add(DataModelPrestadorDeServicoXCidade(
      codPrestadorDeServico: 30,
      codCidade: 1,
    ))
    ..add(DataModelPrestadorDeServicoXCidade(
      codPrestadorDeServico: 40,
      codCidade: 1,
    ))
    ..add(DataModelPrestadorDeServicoXCidade(
      codPrestadorDeServico: 50,
      codCidade: 3,
    ))
    ..add(DataModelPrestadorDeServicoXCidade(
      codPrestadorDeServico: 60,
      codCidade: 3,
    ))
    ..add(DataModelPrestadorDeServicoXCidade(
      codPrestadorDeServico: 70,
      codCidade: 2,
    ));
}
