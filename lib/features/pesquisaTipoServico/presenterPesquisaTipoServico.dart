import 'package:projeto_treinamento/businessModels/businessModelPrincipaisTiposDeServicoCidade.dart';
import 'package:projeto_treinamento/framework/presenter.dart';

import 'blocEventPesquisaTipoServico.dart';
import 'blocPesquisaTipoServico.dart';
import 'viewActionsPesquisaTipoServico.dart';
import 'viewBuilderPesquisaTipoServico.dart';
import 'viewModelPesquisaTipoServico.dart';
import 'viewPesquisaTipoServico.dart';

class PresenterPesquisaTipoServico extends Presenter<ViewPesquisaTipoServico, ViewModelPesquisaTipoServico, ViewActionsPesquisaTipoServico, BlocEventPesquisaTipoServico, BlocPesquisaTipoServico, ViewBuilderPesquisaTipoServico> {
  PresenterPesquisaTipoServico({
    required BlocPesquisaTipoServico bloc,
    required ViewBuilderPesquisaTipoServico viewBuilder,
    required ViewActionsPesquisaTipoServico viewActions,
    required BusinessModelPrincipaisTiposDeServicoCidade principaisTiposDeServicoCidade,
  }) : super(
          bloc: bloc,
          viewBuilder: viewBuilder,
          viewActions: viewActions,
        ) {
    _enviaEventoInicializacaoViewModel(principaisTiposDeServicoCidade);
  }

  factory PresenterPesquisaTipoServico.presenter({required BusinessModelPrincipaisTiposDeServicoCidade principaisTiposDeServicoCidade}) {
    BlocPesquisaTipoServico bloc = BlocPesquisaTipoServico();
    ViewBuilderPesquisaTipoServico viewBuilder = ViewBuilderPesquisaTipoServico();
    ViewActionsPesquisaTipoServico viewActions = ViewActionsPesquisaTipoServico(bloc.pipeIn);
    return PresenterPesquisaTipoServico(
      bloc: bloc,
      viewBuilder: viewBuilder,
      viewActions: viewActions,
      principaisTiposDeServicoCidade: principaisTiposDeServicoCidade,
    );
  }

  void _enviaEventoInicializacaoViewModel(BusinessModelPrincipaisTiposDeServicoCidade principaisTiposDeServicoCidade) {
    BlocEventPesquisaTipoServicoInicializaViewModel blocEvent = BlocEventPesquisaTipoServicoInicializaViewModel(principaisTiposDeServicoCidade: principaisTiposDeServicoCidade);
    this.bloc.pipeIn.send(blocEvent);
  }
}
