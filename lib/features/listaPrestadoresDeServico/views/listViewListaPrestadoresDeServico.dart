import 'package:flutter/cupertino.dart';
import 'package:projeto_treinamento/features/listaPrestadoresDeServico/viewActionsListaPrestadoresDeServico.dart';

import '../viewModelListaPrestadoresDeServico.dart';
import 'listItemListaPrestadoresDeServico.dart';

class ListViewListaPrestadoresDeServico extends StatelessWidget {
  final ViewModelListaPrestadoresDeServico viewModel;
  final ViewActionsListaPrestadoresDeServico viewActions;
  const ListViewListaPrestadoresDeServico({
    Key? key,
    required this.viewModel,
    required this.viewActions,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: viewModel.listaVisivel.length,
        itemBuilder: (BuildContext context, int index) {
          return ListItemListaPrestadoresDeServico(
            prestradorDeServico: viewModel.listaVisivel[index],
            iconeStatusOnline: viewModel.iconeStatusOnline,
            argumentoDePesquisa: viewModel.controlerFieldPesquisa.text,
            viewActions: this.viewActions,
            viewModel: this.viewModel,
          );
        });
  }
}
