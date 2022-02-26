import 'package:projeto_treinamento/framework/businessModel.dart';
import 'package:projeto_treinamento/util/resposta_processamento.dart';

abstract class Provider<BM extends BusinessModel> {
  Future<BM> getBusinessModel(String id);

  Future<List<BM>> getBusinessModels();

  Future<RespostaProcessamento> saveBusinessModel(BM businessModel);

  Future<RespostaProcessamento> removeBusinessModel(BM businessModel);
}
