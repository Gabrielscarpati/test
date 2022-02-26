import 'package:projeto_treinamento/businessModels/businessModelCidade.dart';
import 'package:projeto_treinamento/framework/mixInDescricao.dart';

class FeatureModelPesquisaCidade with MixInDescricao {
  final BusinessModelCidade cidade;

  FeatureModelPesquisaCidade({required this.cidade});

  @override
  String getDescricao() {
    return cidade.nome;
  }
}
