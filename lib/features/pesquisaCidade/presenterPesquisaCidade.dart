import 'package:projeto_treinamento/framework/presenter.dart';
import 'blocEventPesquisaCidade.dart';
import 'blocPesquisaCidade.dart';
import 'viewActionsPesquisaCidade.dart';
import 'viewBuilderPesquisaCidade.dart';
import 'viewPesquisaCidade.dart';
import 'viewModelPesquisaCidade.dart';

class PresenterPesquisaCidade extends Presenter<ViewPesquisaCidade, ViewModelPesquisaCidade, ViewActionsPesquisaCidade, BlocEventPesquisaCidade,
    BlocPesquisaCidade, ViewBuilderPesquisaCidade> {
  PresenterPesquisaCidade({
    required BlocPesquisaCidade bloc,
    required ViewBuilderPesquisaCidade viewBuilder,
    required ViewActionsPesquisaCidade viewActions,
    required int codTipoDeServico,
  }) : super(
          bloc: bloc,
          viewBuilder: viewBuilder,
          viewActions: viewActions,
        ) {
    _enviaEventoInicializacaoViewModel();
  }

  factory PresenterPesquisaCidade.presenter({codTipoDeServico}) {
    print('_factoryII');
    print( DateTime.now().toString());
    BlocPesquisaCidade bloc = BlocPesquisaCidade();
    ViewBuilderPesquisaCidade viewBuilder = ViewBuilderPesquisaCidade();
    ViewActionsPesquisaCidade viewActions = ViewActionsPesquisaCidade(bloc.pipeIn);
    print( DateTime.now().toString());
    print('_factoryFF');
    return PresenterPesquisaCidade(
      bloc: bloc,
      viewBuilder: viewBuilder,
      viewActions: viewActions,
      codTipoDeServico: codTipoDeServico,

    );
  }

  void _enviaEventoInicializacaoViewModel() {
    BlocEventPesquisaCidadeInicializaViewModel blocEvent = BlocEventPesquisaCidadeInicializaViewModel();
    this.bloc.pipeIn.send(blocEvent);
  }
}
