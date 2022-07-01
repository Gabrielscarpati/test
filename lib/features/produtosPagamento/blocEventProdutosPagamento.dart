import 'package:projeto_treinamento/features/produtosPagamento/viewModelProdutosPagamento.dart';
import 'package:projeto_treinamento/framework/blocEvent.dart';

abstract class BlocEventProdutosPagamento extends BlocEvent {}

class BlocEventHubInicializaViewModeltProdutosPagamento
    extends BlocEventProdutosPagamento {
  final ViewModelProdutosPagamento? viewModel;
  BlocEventHubInicializaViewModeltProdutosPagamento({required this.viewModel});
}

class BlocEventProdutosPagamentoAtualizaViewModel
    extends BlocEventProdutosPagamento {
  final ViewModelProdutosPagamento viewModel;

  BlocEventProdutosPagamentoAtualizaViewModel({required this.viewModel});
}
