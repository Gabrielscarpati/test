import 'package:flutter/cupertino.dart';
import '../viewActionsListaVerifyIdentity.dart';
import '../viewModelListaVerifyIdentity.dart';
import 'listItemListaVerifyIdentity.dart';

class ListViewListaVerifyIdentity extends StatelessWidget {
  final ViewModelListaVerifyIdentity viewModel;
  final ViewActionsListaVerifyIdentity viewActions;
  const ListViewListaVerifyIdentity({
    Key? key,
    required this.viewModel,
    required this.viewActions,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: viewModel.listaVisivel.length,
        itemBuilder: (BuildContext context, int index) {
          return ListItemListaVerifyIdentity(
            prestradorDeServico: viewModel.listaVisivel[index],
            //iconeStatusOnline: FontAwesomeIcons.whatsapp,
            argumentoDePesquisa: viewModel.controlerFieldPesquisa.text,
            viewActions: this.viewActions,
            viewModel: this.viewModel,
          );
        });
  }
}
