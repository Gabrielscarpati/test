import 'package:projeto_treinamento/businessModels/businessModelDadosPrestador.dart';
import 'package:projeto_treinamento/businessModels/businessModelIcone.dart';
import 'package:projeto_treinamento/businessModels/businessModelPrestadorDeServicos.dart';
import 'package:projeto_treinamento/businessModels/businessModelTiposDeServico.dart';
import 'package:projeto_treinamento/util/tipoDeServico.dart';

import '../../businessModels/businessModelAvaliacaoPrestadorDeServico.dart';
import '../../businessModels/businessModelCidade.dart';
import '../../businessModels/businessModelPrincipaisTiposDeServicoCidade.dart';
import '../../businessModels/businessModelUsuario.dart';
import '../../framework/viewModel.dart';

class ViewModelHubPrestador extends ViewModel {
  final BusinessModelDadosPrestador prestador;
  final List<BusinessModelCidade> cidade;

  final List<BusinessModelAvaliacaoPrestadorDeServico>
      listaAvaliacoesPrestadorDeServico;
  final BusinessModelPrestadorDeServicos prestadorDeServicos;
  final List<BusinessModelTiposDeServico> tiposDeServico;

  ViewModelHubPrestador({
    required this.prestador,
    required this.cidade,
    required this.listaAvaliacoesPrestadorDeServico,
    required this.prestadorDeServicos,
    required this.tiposDeServico,
  }) : super();
}
