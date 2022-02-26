import 'package:flutter/cupertino.dart';
import 'package:projeto_treinamento/features/hub/views/viewHubCidade.dart';
import 'package:projeto_treinamento/features/hub/views/viewHubServicos.dart';
import 'package:projeto_treinamento/features/hub/views/viewHubUsuario.dart';

import '../viewActionsHub.dart';
import '../viewModelHub.dart';

class ViewHubBody extends StatelessWidget {
  ViewHubBody({
    Key? key,
    required this.viewModel,
    required this.viewActions,
  });

  final ViewModelHub viewModel;
  final ViewActionsHub viewActions;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ViewHubUsuario(viewModel: viewModel, viewActions: viewActions),
        ViewHubCidade(viewModel: viewModel, viewActions: viewActions),
        ViewHubServicos(viewModel: viewModel, viewActions: viewActions),
      ],
    );
  }
}
