import 'package:projeto_treinamento/framework/presenter.dart';
import 'blocEventSelectCidade.dart';
import 'blocSelectCidade.dart';
import 'viewActionsSelectCidade.dart';
import 'viewBuilderSelectCidade.dart';
import 'viewSelectCidade.dart';
import 'viewModelSelectCidade.dart';

class PresenterSelectCidade extends Presenter<
    ViewSelectCidade,
    ViewModelSelectCidade,
    ViewActionsSelectCidade,
    BlocEventSelectCidade,
    BlocSelectCidade,
    ViewBuilderSelectCidade> {
  PresenterSelectCidade({
    required BlocSelectCidade bloc,
    required ViewBuilderSelectCidade viewBuilder,
    required ViewActionsSelectCidade viewActions,

  }) : super(
          bloc: bloc,
          viewBuilder: viewBuilder,
          viewActions: viewActions,
        ) {
    _enviaEventoInicializacaoViewModel();
  }

  factory PresenterSelectCidade.presenter() {

    BlocSelectCidade bloc = BlocSelectCidade();
    ViewBuilderSelectCidade viewBuilder = ViewBuilderSelectCidade();
    ViewActionsSelectCidade viewActions = ViewActionsSelectCidade(bloc.pipeIn);
    return PresenterSelectCidade(
        bloc: bloc,
        viewBuilder: viewBuilder,
        viewActions: viewActions,
    );
  }

  void _enviaEventoInicializacaoViewModel() {
    BlocEventSelectCidadeInicializaViewModel blocEvent =
        BlocEventSelectCidadeInicializaViewModel();
    this.bloc.pipeIn.send(blocEvent);
  }
}
