import 'package:projeto_treinamento/features/pesquisaCidade/viewModelPesquisaCidade.dart';
import 'package:projeto_treinamento/framework/blocEvent.dart';

abstract class BlocEventPesquisaCidade extends BlocEvent {}

class BlocEventPesquisaCidadeInicializaViewModel extends BlocEventPesquisaCidade {}

class BlocEventPesquisaCidadeAplicaFiltroDePesquisa extends BlocEventPesquisaCidade {
  final ViewModelPesquisaCidade viewModel;

  BlocEventPesquisaCidadeAplicaFiltroDePesquisa(this.viewModel);
}



// quais sao os eventos, o que da para fazer com essa tela
