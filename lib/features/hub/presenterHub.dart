import 'package:projeto_treinamento/framework/presenter.dart';

import 'blocEventHub.dart';
import 'blocHub.dart';
import 'viewActionsHub.dart';
import 'viewBuilderHub.dart';
import 'viewHub.dart';
import 'viewModelHub.dart';

class PresenterHub extends Presenter<ViewHub, ViewModelHub, ViewActionsHub, BlocEventHub, BlocHub, ViewBuilderHub> {
  PresenterHub({
    required BlocHub bloc,
    required ViewBuilderHub viewBuilder,
    required ViewActionsHub viewActions,
  }) : super(
          bloc: bloc,
          viewBuilder: viewBuilder,
          viewActions: viewActions,
        ) {
    _enviaEventoInicializacaoViewModel();
  }

  factory PresenterHub.presenter() {
    BlocHub bloc = BlocHub();
    ViewBuilderHub viewBuilder = ViewBuilderHub();
    ViewActionsHub viewActions = ViewActionsHub(bloc.pipeIn);
    return PresenterHub(bloc: bloc, viewBuilder: viewBuilder, viewActions: viewActions);
  }

  void _enviaEventoInicializacaoViewModel() {
    BlocEventHubInicializaViewModel blocEvent = BlocEventHubInicializaViewModel();
    this.bloc.pipeIn.send(blocEvent);
  }
}
