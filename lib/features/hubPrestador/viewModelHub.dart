
import 'package:projeto_treinamento/businessModels/businessModelDadosPrestador.dart';

import '../../businessModels/businessModelCidade.dart';
import '../../businessModels/businessModelPrincipaisTiposDeServicoCidade.dart';
import '../../businessModels/businessModelUsuario.dart';
import '../../framework/viewModel.dart';

class ViewModelHubPrestador extends ViewModel {
  final BusinessModelDadosPrestador prestador;
  final BusinessModelCidade cidade;
  final BusinessModelPrincipaisTiposDeServicoCidade principaisTiposDeServicoCidade;

  ViewModelHubPrestador({
    required this.prestador,
    required this.cidade,
    required this.principaisTiposDeServicoCidade,
  
  }) : super();


}