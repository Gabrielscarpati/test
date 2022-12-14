import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:projeto_treinamento/features/listaPrestadoresDeServico/views/listViewListaPrestadoresDeServico.dart';
import 'package:projeto_treinamento/features/listaPrestadoresDeServico/views/searchTextListaPrestadoresDeServico.dart';

import '../../../util/libraryComponents/colors/colors.dart';
import '../viewActionsListaPrestadoresDeServico.dart';
import '../viewModelListaPrestadoresDeServico.dart';

class BodyListaPrestadoresDeServico extends StatelessWidget {
  final ViewModelListaPrestadoresDeServico viewModel;
  final ViewActionsListaPrestadoresDeServico viewActions;

  const BodyListaPrestadoresDeServico({
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
                child: SearchTextListaPrestadoresDeServico(
                  viewModel: this.viewModel,
                  viewActions: this.viewActions,
                )),
          ),
          Expanded(
              child: ListViewListaPrestadoresDeServico(
            viewModel: this.viewModel,
            viewActions: this.viewActions,
          )),
        ],
      ),
    );
  }
}
