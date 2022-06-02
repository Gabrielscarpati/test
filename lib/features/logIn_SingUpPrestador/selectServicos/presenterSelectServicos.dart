import 'package:projeto_treinamento/framework/presenter.dart';
import 'blocEventSelectServicos.dart';
import 'blocSelectServicos.dart';
import 'viewActionsSelectServicos.dart';
import 'viewBuilderSelectServicos.dart';
import 'viewSelectServicos.dart';
import 'viewModelSelectServicos.dart';

class PresenterSelectServicos extends Presenter<
    ViewSelectServicos,
    ViewModelSelectServicos,
    ViewActionsSelectServicos,
    BlocEventSelectServicos,
    BlocSelectServicos,
    ViewBuilderSelectServicos> {
  PresenterSelectServicos({
    required BlocSelectServicos bloc,
    required ViewBuilderSelectServicos viewBuilder,
    required ViewActionsSelectServicos viewActions,
  }) : super(
          bloc: bloc,
          viewBuilder: viewBuilder,
          viewActions: viewActions,
        ) {
    _enviaEventoInicializacaoViewModel();
  }

  factory PresenterSelectServicos.presenter() {
    BlocSelectServicos bloc = BlocSelectServicos();
    ViewBuilderSelectServicos viewBuilder = ViewBuilderSelectServicos();
    ViewActionsSelectServicos viewActions = ViewActionsSelectServicos(bloc.pipeIn);
    return PresenterSelectServicos(
        bloc: bloc,
        viewBuilder: viewBuilder,
        viewActions: viewActions
    );
  }

  void _enviaEventoInicializacaoViewModel() {
    BlocEventSelectServicosInicializaViewModel blocEvent =
        BlocEventSelectServicosInicializaViewModel();
    this.bloc.pipeIn.send(blocEvent);
  }
}
