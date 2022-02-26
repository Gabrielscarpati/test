import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:projeto_treinamento/businessModels/businessModelUsuario.dart';

import '../viewActionsHub.dart';
import '../viewModelHub.dart';

class ViewHubCidade extends StatelessWidget {
  ViewHubCidade({
    Key? key,
    required this.viewModel,
    required this.viewActions,
  });

  final ViewModelHub viewModel;
  final ViewActionsHub viewActions;

  @override
  Widget build(BuildContext context) {
    BusinessModelUsuario usuario = viewModel.usuario;

    if (viewModel.cidade.codCidade == 0) {
      return SizedBox.shrink();
    }

    return Padding(
      padding: const EdgeInsets.only(top: 32, left: 32, right: 32),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Selecione a sua cidade:",
            style: Theme.of(context).textTheme.headline4!.copyWith(fontSize: Theme.of(context).textTheme.bodyText1!.fontSize),
          ),
          Row(
            children: [
              Expanded(
                child: ElevatedButton(
                  onPressed: () {
                    this.viewActions.abreTelaDePesquisaDeCidade(context, viewModel);
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(viewModel.cidade.nome),
                      Icon(Icons.search),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
