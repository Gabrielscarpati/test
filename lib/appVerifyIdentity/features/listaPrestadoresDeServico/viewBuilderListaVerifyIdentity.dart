import 'package:projeto_treinamento/framework/viewBuilder.dart';

import 'viewActionsListaVerifyIdentity.dart';
import 'viewListaVerifyIdentity.dart';
import 'viewModelListaVerifyIdentity.dart';

class ViewBuilderListaVerifyIdentity extends ViewBuilder<ViewListaVerifyIdentity, ViewModelListaVerifyIdentity, ViewActionsListaVerifyIdentity> {
  @override
  ViewListaVerifyIdentity createView(ViewModelListaVerifyIdentity? viewModel, ViewActionsListaVerifyIdentity viewActions) {
    return ViewListaVerifyIdentity(
      viewModel: viewModel,
      viewActions: viewActions,
    );
  }
}
