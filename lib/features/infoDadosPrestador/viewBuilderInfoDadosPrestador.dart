import 'package:projeto_treinamento/features/infoDadosPrestador/viewActionsInfoDadosPrestador.dart';
import 'package:projeto_treinamento/framework/viewBuilder.dart';
import 'viewInfoDadosPrestador.dart';
import 'viewModelInfoDadosPrestador.dart';

class ViewBuilderInfoDadosPrestador extends ViewBuilder<ViewInfoDadosPrestador, ViewModelInfoDadosPrestador, ViewActionsInfoDadosPrestador> {
  @override
  ViewInfoDadosPrestador createView(ViewModelInfoDadosPrestador? viewModel, ViewActionsInfoDadosPrestador viewActions) {
    return ViewInfoDadosPrestador(
      viewModel: viewModel,
      viewActions: viewActions,
    );
  }
}
