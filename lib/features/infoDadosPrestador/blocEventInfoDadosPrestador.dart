import 'package:projeto_treinamento/features/infoDadosPrestador/viewModelInfoDadosPrestador.dart';
import 'package:projeto_treinamento/framework/blocEvent.dart';

abstract class BlocEventInfoDadosPrestador extends BlocEvent {}

class BlocEventInfoDadosPrestadorInicializaViewModel extends BlocEventInfoDadosPrestador {
  final ViewModelInfoDadosPrestador viewModel;

  BlocEventInfoDadosPrestadorInicializaViewModel({required this.viewModel});
}

class BlocEventInfoDadosPrestadorAtualizaViewModel extends BlocEventInfoDadosPrestador {
  final ViewModelInfoDadosPrestador viewModel;

  BlocEventInfoDadosPrestadorAtualizaViewModel({required this.viewModel});
}
