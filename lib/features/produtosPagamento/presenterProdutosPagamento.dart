import 'package:projeto_treinamento/framework/presenter.dart';

import 'blocEventProdutosPagamento.dart';
import 'blocProdutosPagamento.dart';
import 'viewActionsProdutosPagamento.dart';
import 'viewBuilderProdutosPagamento.dart';
import 'viewProdutosPagamento.dart';
import 'viewModelProdutosPagamento.dart';

class PresenterProdutosPagamento extends Presenter<
    ViewProdutosPagamento,
    ViewModelProdutosPagamento,
    ViewActionsProdutosPagamento,
    BlocEventProdutosPagamento,
    BlocProdutosPagamento,
    ViewBuilderProdutosPagamento> {
  PresenterProdutosPagamento({
    required BlocProdutosPagamento bloc,
    required ViewBuilderProdutosPagamento viewBuilder,
    required ViewActionsProdutosPagamento viewActions,
  }) : super(
          bloc: bloc,
          viewBuilder: viewBuilder,
          viewActions: viewActions,
        ) {
    _enviaEventoInicializacaoViewModel();
  }

  factory PresenterProdutosPagamento.presenter() {
    BlocProdutosPagamento bloc = BlocProdutosPagamento();
    ViewBuilderProdutosPagamento viewBuilder = ViewBuilderProdutosPagamento();
    ViewActionsProdutosPagamento viewActions =
        ViewActionsProdutosPagamento(bloc.pipeIn);
    return PresenterProdutosPagamento(
        bloc: bloc, viewBuilder: viewBuilder, viewActions: viewActions);
  }

  void _enviaEventoInicializacaoViewModel() {
    BlocEventHubInicializaViewModeltProdutosPagamento blocEvent =
        BlocEventHubInicializaViewModeltProdutosPagamento(viewModel: null);
    this.bloc.pipeIn.send(blocEvent);
  }
}
