import 'package:projeto_treinamento/features/hub/viewModelHub.dart';
import 'package:projeto_treinamento/features/infoUsuario/viewModelInfoUsuario.dart';
import 'package:projeto_treinamento/framework/blocEvent.dart';
import 'package:projeto_treinamento/framework/viewModel.dart';

abstract class BlocEventInfoUsuario extends BlocEvent {}

class BlocEventInfoUsuarioInicializaViewModel extends BlocEventInfoUsuario {
  final ViewModelInfoUsuario viewModel;

  BlocEventInfoUsuarioInicializaViewModel({required this.viewModel});
}

class BlocEventInfoUsuarioAtualizaViewModel extends BlocEventInfoUsuario {
  final ViewModelInfoUsuario viewModel;

  BlocEventInfoUsuarioAtualizaViewModel({required this.viewModel});
}
