import 'package:projeto_treinamento/framework/viewBuilder.dart';

import 'viewActionsHub.dart';
import 'viewHub.dart';
import 'viewModelHub.dart';

class ViewBuilderHubUsuario extends ViewBuilder<ViewHubUsuario,
    ViewModelHubUsuario, ViewActionsHubUsuario> {
  @override
  ViewHubUsuario createView(
      ViewModelHubUsuario? viewModel, ViewActionsHubUsuario viewActions) {
    return ViewHubUsuario(
      viewModel: viewModel,
      viewActions: viewActions,
    );
  }
}

// toda view precisa de model e actions