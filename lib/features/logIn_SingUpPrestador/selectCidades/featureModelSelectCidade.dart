import 'package:projeto_treinamento/businessModels/businessModelCidade.dart';
import 'package:projeto_treinamento/framework/mixInDescricao.dart';

class FeatureModelSelectCidade with MixInDescricao {
  final BusinessModelCidade cidade;

  FeatureModelSelectCidade({required this.cidade});

  @override
  String getDescricao() {
    return cidade.nome;
  }
}
