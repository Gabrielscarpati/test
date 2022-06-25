import '../../businessModels/businessModelCidade.dart';
import '../../businessModels/businessModelPrincipaisTiposDeServicoCidade.dart';
import '../../businessModels/businessModelUsuario.dart';
import '../../framework/viewModel.dart';

class ViewModelHubUsuario extends ViewModel {
  final BusinessModelCidade cidade;
  final BusinessModelPrincipaisTiposDeServicoCidade
      principaisTiposDeServicoCidade;

  ViewModelHubUsuario({
    required this.cidade,
    required this.principaisTiposDeServicoCidade,
  }) : super();
}
