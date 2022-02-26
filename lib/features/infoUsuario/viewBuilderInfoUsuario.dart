import 'package:projeto_treinamento/framework/viewBuilder.dart';
import 'viewActionsInfoUsuario.dart';
import 'viewInfoUsuario.dart';
import 'viewModelInfoUsuario.dart';

class ViewBuilderInfoUsuario extends ViewBuilder<ViewInfoUsuario, ViewModelInfoUsuario, ViewActionsInfoUsuario> {
  @override
  ViewInfoUsuario createView(ViewModelInfoUsuario? viewModel, ViewActionsInfoUsuario viewActions) {
    return ViewInfoUsuario(
      viewModel: viewModel,
      viewActions: viewActions,
    );
  }
}
