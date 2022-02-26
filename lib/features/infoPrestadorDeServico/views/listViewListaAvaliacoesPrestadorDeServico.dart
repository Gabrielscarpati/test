import 'package:flutter/cupertino.dart';
import 'package:projeto_treinamento/features/infoPrestadorDeServico/viewModelInfoPrestadorDeServico.dart';
import 'package:projeto_treinamento/features/listaPrestadoresDeServico/viewActionsListaPrestadoresDeServico.dart';

import '../viewActionsInfoPrestadorDeServico.dart';
import 'listItemAvaliacaoPrestadorDeServico.dart';

class ListViewListaAvaliacaoPrestadorDeServico extends StatelessWidget {
  final ViewModelInfoPrestadorDeServico viewModel;
  final ViewActionsInfoPrestadorDeServico viewActions;
  const ListViewListaAvaliacaoPrestadorDeServico({
    Key? key,
    required this.viewModel,
    required this.viewActions,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: viewModel.listaAvaliacoesPrestadorDeServico.length,
        itemBuilder: (BuildContext context, int index) {
          return ListItemAvaliacaoPrestadorDeServico(
            viewActions: viewActions,
            avaliacao: viewModel.listaAvaliacoesPrestadorDeServico[index],
          );
        });
  }
}
