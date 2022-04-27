import 'package:projeto_treinamento/framework/viewBuilder.dart';

import 'viewActionsHub.dart';
import 'viewHub.dart';
import 'viewModelHub.dart';

class ViewBuilderHub extends ViewBuilder<ViewHub, ViewModelHub, ViewActionsHub> {
  @override
  ViewHub createView(ViewModelHub? viewModel, ViewActionsHub viewActions) {
    return ViewHub(
      viewModel: viewModel,
      viewActions: viewActions,
    );
  }
}

// toda view precisa de model e actions