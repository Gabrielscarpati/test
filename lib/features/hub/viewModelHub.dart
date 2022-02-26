import 'package:projeto_treinamento/businessModels/businessModelCidade.dart';
import 'package:projeto_treinamento/businessModels/businessModelPrincipaisTiposDeServicoCidade.dart';
import 'package:projeto_treinamento/businessModels/businessModelUsuario.dart';
import 'package:projeto_treinamento/framework/viewModel.dart';

class ViewModelHub extends ViewModel {
  final BusinessModelUsuario usuario;
  final BusinessModelCidade cidade;
  final BusinessModelPrincipaisTiposDeServicoCidade principaisTiposDeServicoCidade;

  ViewModelHub({
    required this.usuario,
    required this.cidade,
    required this.principaisTiposDeServicoCidade,
  }) : super();
}