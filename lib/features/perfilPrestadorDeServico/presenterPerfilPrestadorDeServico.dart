import 'package:projeto_treinamento/businessModels/businessModelPrestadorInfomation.dart';
import 'package:projeto_treinamento/features/hub/viewModelHub.dart';
import 'package:projeto_treinamento/features/perfilPrestadorDeServico/blocEventPerfilPrestadorDeServico.dart';
import 'package:projeto_treinamento/features/perfilPrestadorDeServico/blocPerfilPrestadorDeServico.dart';
import 'package:projeto_treinamento/framework/presenter.dart';

import 'viewActionsPerfilPrestadorDeServico.dart';
import 'viewBuilderPerfilPrestadorDeServico.dart';
import 'viewPerfilPrestadorDeServico.dart';
import 'viewModelPerfilPrestadorDeServico.dart';

class PresenterPerfilPrestadorDeServico extends Presenter<
    ViewPerfilPrestadorDeServico,
    ViewModelPerfilPrestadorDeServico,
    ViewActionsPerfilPrestadorDeServico,
    BlocEventPerfilPrestadorDeServico,
    BlocPerfilPrestadorDeServico,
    ViewBuilderPerfilPrestadorDeServico> {
  PresenterPerfilPrestadorDeServico({
    required BlocPerfilPrestadorDeServico bloc,
    required ViewBuilderPerfilPrestadorDeServico viewBuilder,
    required ViewActionsPerfilPrestadorDeServico viewActions,
    required ViewModelPerfilPrestadorDeServico viewModel,
  }) : super(
          bloc: bloc,
          viewBuilder: viewBuilder,
          viewActions: viewActions,
        ) {
    _enviaEventoInicializacaoViewModel(viewModel);
  }

  factory PresenterPerfilPrestadorDeServico.presenter() {
    BlocPerfilPrestadorDeServico bloc = BlocPerfilPrestadorDeServico();
    ViewBuilderPerfilPrestadorDeServico viewBuilder =
        ViewBuilderPerfilPrestadorDeServico();
    ViewActionsPerfilPrestadorDeServico viewActions =
        ViewActionsPerfilPrestadorDeServico(bloc.pipeIn);
    return PresenterPerfilPrestadorDeServico(
      bloc: bloc,
      viewBuilder: viewBuilder,
      viewActions: viewActions,
      viewModel: ViewModelPerfilPrestadorDeServico(
          prestadorInformation: BusinessModelPrestadorInformation(
        IdUsuario: "",
        nome: "",
        phone: "",
        city: "",
        description: "",
        roles: "",
        workingHours: "",
      )),
    );
  }

  void _enviaEventoInicializacaoViewModel(
      ViewModelPerfilPrestadorDeServico viewModel) {
    BlocEventPerfilPrestadorDeServicoInicializaViewModel blocEvent =
        BlocEventPerfilPrestadorDeServicoInicializaViewModel(
            viewModel: viewModel);
    this.bloc.pipeIn.send(blocEvent);
  }
}
