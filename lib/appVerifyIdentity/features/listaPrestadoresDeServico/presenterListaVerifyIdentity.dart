import 'package:projeto_treinamento/appVerifyIdentity/features/listaPrestadoresDeServico/viewActionsListaVerifyIdentity.dart';
import 'package:projeto_treinamento/appVerifyIdentity/features/listaPrestadoresDeServico/viewBuilderListaVerifyIdentity.dart';
import 'package:projeto_treinamento/appVerifyIdentity/features/listaPrestadoresDeServico/viewListaVerifyIdentity.dart';
import 'package:projeto_treinamento/appVerifyIdentity/features/listaPrestadoresDeServico/viewModelListaVerifyIdentity.dart';
import 'package:projeto_treinamento/framework/presenter.dart';

import 'blocEventListaVerifyIdentity.dart';
import 'blocListaVerifyIdentity.dart';

class PresenterListaVerifyIdentity extends Presenter<ViewListaVerifyIdentity, ViewModelListaVerifyIdentity, ViewActionsListaVerifyIdentity, BlocEventListaVerifyIdentity, BlocListaVerifyIdentity, ViewBuilderListaVerifyIdentity> {
  PresenterListaVerifyIdentity({
    required BlocListaVerifyIdentity bloc,
    required ViewBuilderListaVerifyIdentity viewBuilder,
    required ViewActionsListaVerifyIdentity viewActions,
  }) : super(
          bloc: bloc,
          viewBuilder: viewBuilder,
          viewActions: viewActions,
        ) {
    _enviaEventoInicializacaoViewModel();
  }

  factory PresenterListaVerifyIdentity.presenter() {
    BlocListaVerifyIdentity bloc = BlocListaVerifyIdentity();
    ViewBuilderListaVerifyIdentity viewBuilder = ViewBuilderListaVerifyIdentity();
    ViewActionsListaVerifyIdentity viewActions = ViewActionsListaVerifyIdentity(bloc.pipeIn);
    return PresenterListaVerifyIdentity(
      bloc: bloc,
      viewBuilder: viewBuilder,
      viewActions: viewActions,

    );
  }

  void _enviaEventoInicializacaoViewModel() {
    BlocEventListaVerifyIdentityInicializaViewModel blocEvent = BlocEventListaVerifyIdentityInicializaViewModel(

    );
    this.bloc.pipeIn.send(blocEvent);
  }
}
