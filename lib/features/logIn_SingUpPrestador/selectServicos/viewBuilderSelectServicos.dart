import 'package:projeto_treinamento/framework/viewBuilder.dart';

import 'viewActionsSelectServicos.dart';
import 'viewSelectServicos.dart';
import 'viewModelSelectServicos.dart';

class ViewBuilderSelectServicos extends ViewBuilder<ViewSelectServicos,
    ViewModelSelectServicos, ViewActionsSelectServicos> {
  @override
  ViewSelectServicos createView(
      ViewModelSelectServicos? viewModel, ViewActionsSelectServicos viewActions) {
    return ViewSelectServicos(
      viewModel: viewModel,
      viewActions: viewActions,
    );
  }
}

// toda view precisa de model e actions