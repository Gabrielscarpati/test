import 'package:projeto_treinamento/features/hubPrestador/viewModelHub.dart';
import 'package:projeto_treinamento/framework/blocEvent.dart';

abstract class BlocEventHubPrestador extends BlocEvent {}

class BlocEventHubInicializaViewModelPrestador extends BlocEventHubPrestador {}

class BlocEventHubSelecionaCidade extends BlocEventHubPrestador {
  final int codCidade;
  final ViewModelHubPrestador viewModel;

  BlocEventHubSelecionaCidade({required this.codCidade, required this.viewModel});
}

class BlocEventHubPrestadorAtualizaViewModel extends BlocEventHubPrestador {
  final ViewModelHubPrestador viewModel;

  BlocEventHubPrestadorAtualizaViewModel({required this.viewModel});
}
