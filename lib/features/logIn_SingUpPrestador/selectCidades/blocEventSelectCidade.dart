import 'package:projeto_treinamento/features/logIn_SingUpPrestador/selectCidades/viewModelSelectCidade.dart';
import 'package:projeto_treinamento/framework/blocEvent.dart';

abstract class BlocEventSelectCidade extends BlocEvent {}

class BlocEventSelectCidadeInicializaViewModel extends BlocEventSelectCidade {}

class BlocEventSelectCidadeSelecionaCidade extends BlocEventSelectCidade {
  final int codCidade;
  final ViewModelSelectCidade viewModel;

  BlocEventSelectCidadeSelecionaCidade(
      {required this.codCidade, required this.viewModel});
}

class BlocEventSelectCidadeAtualizaViewModel extends BlocEventSelectCidade {
  final ViewModelSelectCidade viewModel;

  BlocEventSelectCidadeAtualizaViewModel({required this.viewModel});
}

class BlocEventSelectCidadeAtualizaCidadesSelecionadas
    extends BlocEventSelectCidade {
  final ViewModelSelectCidade viewModel;
  final int idCidadeSelecionada;

  BlocEventSelectCidadeAtualizaCidadesSelecionadas(
      {required this.viewModel, required this.idCidadeSelecionada});
}


class BlocEventSelectCidadeAplicaFiltroDePesquisa extends BlocEventSelectCidade {
  final ViewModelSelectCidade viewModel;

  BlocEventSelectCidadeAplicaFiltroDePesquisa(this.viewModel);
}

class BlocEventSavarListaSelecionadaFirebase extends BlocEventSelectCidade {
  final ViewModelSelectCidade viewModel;

  BlocEventSavarListaSelecionadaFirebase(this.viewModel);
}



