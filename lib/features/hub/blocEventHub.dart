import 'package:projeto_treinamento/features/hub/viewModelHub.dart';
import 'package:projeto_treinamento/framework/blocEvent.dart';

abstract class BlocEventHub extends BlocEvent {}

class BlocEventHubInicializaViewModel extends BlocEventHub {}

class BlocEventHubSelecionaCidade extends BlocEventHub {
  final int codCidade;
  final ViewModelHub viewModel;

  BlocEventHubSelecionaCidade({required this.codCidade, required this.viewModel});
}

class BlocEventHubAtualizaViewModel extends BlocEventHub {
  final ViewModelHub viewModel;

  BlocEventHubAtualizaViewModel({required this.viewModel});
}
