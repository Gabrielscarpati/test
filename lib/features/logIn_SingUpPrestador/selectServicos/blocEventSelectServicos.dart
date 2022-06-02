import 'package:projeto_treinamento/features/logIn_SingUpPrestador/selectServicos/viewModelSelectServicos.dart';
import 'package:projeto_treinamento/framework/blocEvent.dart';

abstract class BlocEventSelectServicos extends BlocEvent {}

class BlocEventSelectServicosInicializaViewModel extends BlocEventSelectServicos {}

class BlocEventSelectServicosSelecionaServicos extends BlocEventSelectServicos {
  final int codCidade;
  final ViewModelSelectServicos viewModel;

  BlocEventSelectServicosSelecionaServicos(
      {required this.codCidade, required this.viewModel});
}

class BlocEventSelectServicosAtualizaViewModel extends BlocEventSelectServicos {
  final ViewModelSelectServicos viewModel;

  BlocEventSelectServicosAtualizaViewModel({required this.viewModel});
}

class BlocEventSelectServicosAtualizaServicosSelecionados
    extends BlocEventSelectServicos {
  final ViewModelSelectServicos viewModel;
  final int idCidadeSelecionada;

  BlocEventSelectServicosAtualizaServicosSelecionados(
      {required this.viewModel, required this.idCidadeSelecionada});
}


class BlocEventSelectServicosAplicaFiltroDePesquisa extends BlocEventSelectServicos {
  final ViewModelSelectServicos viewModel;

  BlocEventSelectServicosAplicaFiltroDePesquisa(this.viewModel);
}

class BlocEventSavarListaSelecionadaFirebase extends BlocEventSelectServicos {
  final ViewModelSelectServicos viewModel;

  BlocEventSavarListaSelecionadaFirebase(this.viewModel);
}



