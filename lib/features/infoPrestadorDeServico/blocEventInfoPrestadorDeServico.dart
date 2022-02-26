import 'package:projeto_treinamento/businessModels/businessModelCidade.dart';
import 'package:projeto_treinamento/businessModels/businessModelPrestadorDeServicos.dart';
import 'package:projeto_treinamento/businessModels/businessModelTiposDeServico.dart';
import 'package:projeto_treinamento/framework/blocEvent.dart';

abstract class BlocEventInfoPrestadorDeServico extends BlocEvent {}

class BlocEventInfoPrestadorDeServicoInicializaViewModel extends BlocEventInfoPrestadorDeServico {
  final BusinessModelPrestadorDeServicos prestadorDeServicos;
  final BusinessModelCidade cidade;
  final BusinessModelTiposDeServico tipoServico;

  BlocEventInfoPrestadorDeServicoInicializaViewModel(this.prestadorDeServicos, this.cidade, this.tipoServico);
}
