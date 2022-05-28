import 'package:projeto_treinamento/features/infoUsuario/viewModelInfoUsuario.dart';
import 'package:projeto_treinamento/framework/blocEvent.dart';

abstract class BlocEventInfoUsuario extends BlocEvent {}

class BlocEventInfoUsuarioInicializaViewModel extends BlocEventInfoUsuario {
  final ViewModelInfoUsuario viewModel;

  BlocEventInfoUsuarioInicializaViewModel({required this.viewModel});
}

class BlocEventInfoUsuarioAtualizaViewModel extends BlocEventInfoUsuario {
  final ViewModelInfoUsuario viewModel;

  BlocEventInfoUsuarioAtualizaViewModel({required this.viewModel});
}
