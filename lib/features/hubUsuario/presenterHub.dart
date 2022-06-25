import 'package:projeto_treinamento/framework/presenter.dart';

import 'blocEventHub.dart';
import 'blocHub.dart';
import 'viewActionsHub.dart';
import 'viewBuilderHub.dart';
import 'viewHub.dart';
import 'viewModelHub.dart';

class PresenterHubUsuario extends Presenter<
    ViewHubUsuario,
    ViewModelHubUsuario,
    ViewActionsHubUsuario,
    BlocEventHubUsuario,
    BlocHub,
    ViewBuilderHubUsuario> {
  PresenterHubUsuario({
    required BlocHub bloc,
    required ViewBuilderHubUsuario viewBuilder,
    required ViewActionsHubUsuario viewActions,
  }) : super(
          bloc: bloc,
          viewBuilder: viewBuilder,
          viewActions: viewActions,
        ) {
    _enviaEventoInicializacaoViewModel();
  }

  factory PresenterHubUsuario.presenter() {
    BlocHub bloc = BlocHub();
    ViewBuilderHubUsuario viewBuilder = ViewBuilderHubUsuario();
    ViewActionsHubUsuario viewActions = ViewActionsHubUsuario(bloc.pipeIn);
    return PresenterHubUsuario(
        bloc: bloc, viewBuilder: viewBuilder, viewActions: viewActions);
  }

  void _enviaEventoInicializacaoViewModel() {
    BlocEventHubInicializaViewModelUsuario blocEvent =
        BlocEventHubInicializaViewModelUsuario(viewModel: null);
    this.bloc.pipeIn.send(blocEvent);
  }
}
