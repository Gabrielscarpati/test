import 'package:projeto_treinamento/framework/presenter.dart';

import 'blocEventHub.dart';
import 'blocHub.dart';
import 'viewActionsHub.dart';
import 'viewBuilderHub.dart';
import 'viewHub.dart';
import 'viewModelHub.dart';

class PresenterHubPrestador extends Presenter<ViewHubPrestador, ViewModelHubPrestador, ViewActionsHubPrestador, BlocEventHubPrestador, BlocHub, ViewBuilderHubPrestador> {
  PresenterHubPrestador({
    required BlocHub bloc,
    required ViewBuilderHubPrestador viewBuilder,
    required ViewActionsHubPrestador viewActions,
  }) : super(
          bloc: bloc,
          viewBuilder: viewBuilder,
          viewActions: viewActions,
        ) {
    _enviaEventoInicializacaoViewModel();
  }

  factory PresenterHubPrestador.presenter() {
    BlocHub bloc = BlocHub();
    ViewBuilderHubPrestador viewBuilder = ViewBuilderHubPrestador();
    ViewActionsHubPrestador viewActions = ViewActionsHubPrestador(bloc.pipeIn);
    return PresenterHubPrestador(bloc: bloc, viewBuilder: viewBuilder, viewActions: viewActions);
  }

  void _enviaEventoInicializacaoViewModel() {
    BlocEventHubInicializaViewModelPrestador blocEvent = BlocEventHubInicializaViewModelPrestador(viewModel: null);
    this.bloc.pipeIn.send(blocEvent);
  }
}
