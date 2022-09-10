import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:projeto_treinamento/appVerifyIdentity/features/listaPrestadoresDeServico/views/searchTextListaVerifyIdentity.dart';
import 'package:projeto_treinamento/features/listaPrestadoresDeServico/views/listViewListaPrestadoresDeServico.dart';
import 'package:projeto_treinamento/features/listaPrestadoresDeServico/views/searchTextListaPrestadoresDeServico.dart';

import '../../../../util/libraryComponents/colors/colors.dart';
import '../viewActionsListaVerifyIdentity.dart';
import '../viewModelListaVerifyIdentity.dart';
import 'listViewListaVerifyIdentity.dart';

class BodyListaVerifyIdentity extends StatelessWidget {
  final ViewModelListaVerifyIdentity viewModel;
  final ViewActionsListaVerifyIdentity viewActions;

  const BodyListaVerifyIdentity({
    Key? key,
    required this.viewModel,
    required this.viewActions,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: BackgroundColorGrey,
      child: Column(
        children: [

          Card(
            borderOnForeground: true,

            child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: SearchTextListaVerifyIdentity(
                  viewModel: this.viewModel,
                  viewActions: this.viewActions,
                )),
          ),
          Expanded(
              child: ListViewListaVerifyIdentity(
            viewModel: this.viewModel,
            viewActions: this.viewActions,
          )),
        ],
      ),
    );
  }
}
