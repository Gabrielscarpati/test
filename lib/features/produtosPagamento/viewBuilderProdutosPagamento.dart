import 'package:projeto_treinamento/framework/viewBuilder.dart';

import 'viewActionsProdutosPagamento.dart';
import 'viewProdutosPagamento.dart';
import 'viewModelProdutosPagamento.dart';

class ViewBuilderProdutosPagamento extends ViewBuilder<ViewProdutosPagamento,
    ViewModelProdutosPagamento, ViewActionsProdutosPagamento> {
  @override
  ViewProdutosPagamento createView(ViewModelProdutosPagamento? viewModel,
      ViewActionsProdutosPagamento viewActions) {
    return ViewProdutosPagamento(
      viewModel: viewModel,
      viewActions: viewActions,
    );
  }
}

// toda view precisa de model e actions