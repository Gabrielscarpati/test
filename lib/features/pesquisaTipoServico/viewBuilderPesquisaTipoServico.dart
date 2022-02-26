import 'package:projeto_treinamento/framework/viewBuilder.dart';

import 'viewActionsPesquisaTipoServico.dart';
import 'viewModelPesquisaTipoServico.dart';
import 'viewPesquisaTipoServico.dart';

class ViewBuilderPesquisaTipoServico extends ViewBuilder<ViewPesquisaTipoServico, ViewModelPesquisaTipoServico, ViewActionsPesquisaTipoServico> {
  @override
  ViewPesquisaTipoServico createView(ViewModelPesquisaTipoServico? viewModel, ViewActionsPesquisaTipoServico viewActions) {
    return ViewPesquisaTipoServico(
      viewModel: viewModel,
      viewActions: viewActions,
    );
  }
}
