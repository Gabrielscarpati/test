import 'package:projeto_treinamento/framework/viewBuilder.dart';

import 'viewActionsSelectCidade.dart';
import 'viewSelectCidade.dart';
import 'viewModelSelectCidade.dart';

class ViewBuilderSelectCidade extends ViewBuilder<ViewSelectCidade,
    ViewModelSelectCidade, ViewActionsSelectCidade> {
  @override
  ViewSelectCidade createView(
      ViewModelSelectCidade? viewModel, ViewActionsSelectCidade viewActions) {
    return ViewSelectCidade(
      viewModel: viewModel,
      viewActions: viewActions,
    );
  }
}

// toda view precisa de model e actions