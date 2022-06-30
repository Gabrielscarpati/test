import 'package:projeto_treinamento/businessModels/businessModelAvaliacaoPrestadorDeServico.dart';
import 'package:projeto_treinamento/businessModels/businessModelCidade.dart';
import 'package:projeto_treinamento/businessModels/businessModelIcone.dart';
import 'package:projeto_treinamento/businessModels/businessModelPrestadorDeServicos.dart';
import 'package:projeto_treinamento/businessModels/businessModelPrestadorDeServicoxCidade.dart';
import 'package:projeto_treinamento/businessModels/businessModelPrestadorDeServicoxTipoDeServico.dart';
import 'package:projeto_treinamento/businessModels/businessModelTiposDeServico.dart';
import 'package:projeto_treinamento/framework/viewModel.dart';

class ViewModelInfoPrestadorDeServico extends ViewModel {
  ViewModelInfoPrestadorDeServico({
    required this.prestadorDeServicos,
    required this.listaAvaliacoesPrestadorDeServico,
    required this.cidade,
    required this.tiposDeServico,
  }) : super();

  final BusinessModelPrestadorDeServicos prestadorDeServicos;
  final List<BusinessModelAvaliacaoPrestadorDeServico> listaAvaliacoesPrestadorDeServico;
  final BusinessModelCidade cidade;
  final BusinessModelTiposDeServico tiposDeServico;
}
