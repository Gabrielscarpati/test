import 'package:projeto_treinamento/appVerifyIdentity/features/listaPrestadoresDeServico/viewModelListaVerifyIdentity.dart';
import 'package:projeto_treinamento/framework/blocEvent.dart';

abstract class BlocEventListaVerifyIdentity extends BlocEvent {}

class BlocEventListaVerifyIdentityInicializaViewModel extends BlocEventListaVerifyIdentity {


  BlocEventListaVerifyIdentityInicializaViewModel();
}

class BlocEventListaVerifyIdentityAplicaFiltroDePesquisa extends BlocEventListaVerifyIdentity {
  final ViewModelListaVerifyIdentity viewModel;

  BlocEventListaVerifyIdentityAplicaFiltroDePesquisa(this.viewModel);
}
