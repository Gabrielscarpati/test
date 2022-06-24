import 'package:projeto_treinamento/framework/presenter.dart';
import 'blocEventListaPrestadoresDeServico.dart';
import 'blocListaPrestadoresDeServico.dart';
import 'viewActionsListaPrestadoresDeServico.dart';
import 'viewBuilderListaPrestadoresDeServico.dart';
import 'viewListaPrestadoresDeServico.dart';
import 'viewModelListaPrestadoresDeServico.dart';

class PresenterListaPrestadoresDeServico extends Presenter<ViewListaPrestadoresDeServico, ViewModelListaPrestadoresDeServico, ViewActionsListaPrestadoresDeServico, BlocEventListaPrestadoresDeServico, BlocListaPrestadoresDeServico, ViewBuilderListaPrestadoresDeServico> {
  PresenterListaPrestadoresDeServico({
    required BlocListaPrestadoresDeServico bloc,
    required ViewBuilderListaPrestadoresDeServico viewBuilder,
    required ViewActionsListaPrestadoresDeServico viewActions,
    required int codTipoDeServico,
    required int codCidade,
  }) : super(
          bloc: bloc,
          viewBuilder: viewBuilder,
          viewActions: viewActions,
        ) {
    _enviaEventoInicializacaoViewModel(codTipoDeServico, codCidade);
  }

  factory PresenterListaPrestadoresDeServico.presenter({required int codTipoDeServico, required int codCidade}) {
    BlocListaPrestadoresDeServico bloc = BlocListaPrestadoresDeServico();
    ViewBuilderListaPrestadoresDeServico viewBuilder = ViewBuilderListaPrestadoresDeServico();
    ViewActionsListaPrestadoresDeServico viewActions = ViewActionsListaPrestadoresDeServico(bloc.pipeIn);
    return PresenterListaPrestadoresDeServico(
      bloc: bloc,
      viewBuilder: viewBuilder,
      viewActions: viewActions,
      codTipoDeServico: codTipoDeServico,
      codCidade: codCidade,
    );
  }

  void _enviaEventoInicializacaoViewModel(int codTipoDeServico, int codCidade) {
    BlocEventListaPrestadoresDeServicoInicializaViewModel blocEvent = BlocEventListaPrestadoresDeServicoInicializaViewModel(
      codTipoDeServico: codTipoDeServico,
      codCidade: codCidade,
    );
    this.bloc.pipeIn.send(blocEvent);
  }
}
