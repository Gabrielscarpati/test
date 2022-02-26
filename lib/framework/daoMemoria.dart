import 'package:projeto_treinamento/util/resposta_processamento.dart';

import 'dao.dart';
import 'dataModel.dart';

abstract class DaoMemoria<DM extends DataModel> extends Dao<DM> {
  final List<DM> dados;

  DaoMemoria({required this.dados});

  int getPosById(String id) {
    for (int i = 0; i < dados.length; i++) {
      DM dataModel = dados[i];
      if (dataModel.id == id) return i;
    }
    return -1;
  }

  Future<DM?> getDataModel(String id) async {
    int pos = getPosById(id);
    if (pos >= 0)
      return dados[pos];
    else
      return null;
  }

  Future<List<DM>> getDataModels() async {
    List<DM> lista = List.empty(growable: true);
    for (int i = 0; i < dados.length; i++) {
      DM dataModel = dados[i];
      lista.add(dataModel);
    }
    return lista;
  }

  Future<RespostaProcessamento> saveDataModel(DM dataModel) async {
    int pos = getPosById(dataModel.id);
    if (pos < 0) {
      dados.add(dataModel);
    } else {
      dados[pos] = dataModel;
    }
    return RespostaProcessamento.ok();
  }

  Future<RespostaProcessamento> removeDataModel(DM dataModel) async {
    int pos = getPosById(dataModel.id);
    if (pos >= 0) dados.removeAt(pos);
    return RespostaProcessamento.ok();
  }
}
