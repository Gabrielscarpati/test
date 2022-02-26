import 'package:projeto_treinamento/features/hub/viewModelHub.dart';
import 'package:projeto_treinamento/framework/presenter.dart';
import 'blocEventInfoUsuario.dart';
import 'blocInfoUsuario.dart';
import 'viewActionsInfoUsuario.dart';
import 'viewBuilderInfoUsuario.dart';
import 'viewInfoUsuario.dart';
import 'viewModelInfoUsuario.dart';

class PresenterInfoUsuario
    extends Presenter<ViewInfoUsuario, ViewModelInfoUsuario, ViewActionsInfoUsuario, BlocEventInfoUsuario, BlocInfoUsuario, ViewBuilderInfoUsuario> {
  PresenterInfoUsuario({
    required BlocInfoUsuario bloc,
    required ViewBuilderInfoUsuario viewBuilder,
    required ViewActionsInfoUsuario viewActions,
    required ViewModelInfoUsuario viewModel,
  }) : super(
          bloc: bloc,
          viewBuilder: viewBuilder,
          viewActions: viewActions,
        ) {
    _enviaEventoInicializacaoViewModel(viewModel);
  }

  factory PresenterInfoUsuario.presenter({
    required ViewModelInfoUsuario viewModel,
  }) {
    BlocInfoUsuario bloc = BlocInfoUsuario();
    ViewBuilderInfoUsuario viewBuilder = ViewBuilderInfoUsuario();
    ViewActionsInfoUsuario viewActions = ViewActionsInfoUsuario(bloc.pipeIn);
    return PresenterInfoUsuario(
      bloc: bloc,
      viewBuilder: viewBuilder,
      viewActions: viewActions,
      viewModel: viewModel,
    );
  }

  void _enviaEventoInicializacaoViewModel(ViewModelInfoUsuario viewModel) {
    BlocEventInfoUsuarioInicializaViewModel blocEvent = BlocEventInfoUsuarioInicializaViewModel(viewModel: viewModel);
    this.bloc.pipeIn.send(blocEvent);
  }
}
