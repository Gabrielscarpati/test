import 'package:projeto_treinamento/businessModels/businessModelPrincipaisTiposDeServicoCidade.dart';
import 'package:projeto_treinamento/features/pesquisaTipoServico/viewModelPesquisaTipoServico.dart';
import 'package:projeto_treinamento/framework/blocEvent.dart';

abstract class BlocEventPesquisaTipoServico extends BlocEvent {}

class BlocEventPesquisaTipoServicoInicializaViewModel extends BlocEventPesquisaTipoServico {
  final BusinessModelPrincipaisTiposDeServicoCidade principaisTiposDeServicoCidade;

  BlocEventPesquisaTipoServicoInicializaViewModel({required this.principaisTiposDeServicoCidade});

}

class BlocEventPesquisaTipoServicoAplicaFiltroDePesquisa extends BlocEventPesquisaTipoServico {
  final ViewModelPesquisaTipoServico viewModel;

  BlocEventPesquisaTipoServicoAplicaFiltroDePesquisa(this.viewModel);
}
