import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../viewActionsListaPrestadoresDeServico.dart';
import '../viewModelListaPrestadoresDeServico.dart';

class ActionsListaPrestadoresDeServico extends StatelessWidget {
  final ViewModelListaPrestadoresDeServico viewModel;
  final ViewActionsListaPrestadoresDeServico viewActions;

  const ActionsListaPrestadoresDeServico({
    Key? key,
    required this.viewModel,
    required this.viewActions,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
            icon: Icon(Icons.refresh),
            onPressed: () {
              this.viewActions.refreshDadosDaTela(this.viewModel);
            }),
      ],
    );
  }
}
