import 'package:projeto_treinamento/features/infoDadosPrestador/blocInfoDadosPrestador.dart';
import 'package:projeto_treinamento/features/infoDadosPrestador/viewActionsInfoDadosPrestador.dart';
import 'package:projeto_treinamento/features/infoDadosPrestador/viewBuilderInfoDadosPrestador.dart';
import 'package:projeto_treinamento/framework/presenter.dart';
import 'blocEventInfoDadosPrestador.dart';
import 'viewInfoDadosPrestador.dart';
import 'viewModelInfoDadosPrestador.dart';

class PresenterInfoDadosPrestador
    extends Presenter<ViewInfoDadosPrestador, ViewModelInfoDadosPrestador, ViewActionsInfoDadosPrestador, BlocEventInfoDadosPrestador, BlocInfoDadosPrestador, ViewBuilderInfoDadosPrestador> {
  PresenterInfoDadosPrestador({
    required BlocInfoDadosPrestador bloc,
    required ViewBuilderInfoDadosPrestador viewBuilder,
    required ViewActionsInfoDadosPrestador viewActions,
    required ViewModelInfoDadosPrestador viewModel,
  }) : super(
          bloc: bloc,
          viewBuilder: viewBuilder,
          viewActions: viewActions,
        ) {
    _enviaEventoInicializacaoViewModel(viewModel);
  }

  factory PresenterInfoDadosPrestador.presenter({
    required ViewModelInfoDadosPrestador viewModel,
  }) {
    BlocInfoDadosPrestador bloc = BlocInfoDadosPrestador();
    ViewBuilderInfoDadosPrestador viewBuilder = ViewBuilderInfoDadosPrestador();
    ViewActionsInfoDadosPrestador viewActions = ViewActionsInfoDadosPrestador(bloc.pipeIn);
    return PresenterInfoDadosPrestador(
      bloc: bloc,
      viewBuilder: viewBuilder,
      viewActions: viewActions,
      viewModel: viewModel,
    );
  }

  void _enviaEventoInicializacaoViewModel(ViewModelInfoDadosPrestador viewModel) {
    BlocEventInfoDadosPrestadorInicializaViewModel blocEvent = BlocEventInfoDadosPrestadorInicializaViewModel(viewModel: viewModel);
    this.bloc.pipeIn.send(blocEvent);
  }
}
