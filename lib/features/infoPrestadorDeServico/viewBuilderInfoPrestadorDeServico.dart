import 'package:projeto_treinamento/framework/viewBuilder.dart';
import 'viewActionsInfoPrestadorDeServico.dart';
import 'viewInfoPrestadorDeServico.dart';
import 'viewModelInfoPrestadorDeServico.dart';

class ViewBuilderInfoPrestadorDeServico extends ViewBuilder<ViewInfoPrestadorDeServico, ViewModelInfoPrestadorDeServico, ViewActionsInfoPrestadorDeServico> {
  @override
  ViewInfoPrestadorDeServico createView(ViewModelInfoPrestadorDeServico? viewModel, ViewActionsInfoPrestadorDeServico viewActions) {
    return ViewInfoPrestadorDeServico(
      viewModel: viewModel,
      viewActions: viewActions,
    );
  }
}
