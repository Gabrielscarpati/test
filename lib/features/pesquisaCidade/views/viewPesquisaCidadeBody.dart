import 'package:flutter/cupertino.dart';
import 'package:projeto_treinamento/features/pesquisaCidade/viewModelPesquisaCidade.dart';
import 'package:projeto_treinamento/features/pesquisaCidade/views/viewHeaderPesquisaCidade.dart';
import 'package:projeto_treinamento/features/pesquisaCidade/views/viewListaCidades.dart';

import '../viewActionsPesquisaCidade.dart';

class ViewPesquisaCidadeBody extends StatelessWidget {
  ViewPesquisaCidadeBody(
    BuildContext context, {
    Key? key,
    required this.viewModel,
    required this.viewActions,
  });

  final ViewModelPesquisaCidade viewModel;
  final ViewActionsPesquisaCidade viewActions;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: ViewHeaderPesquisaCidade(viewModel: viewModel, viewActions: viewActions),
        ),
        ViewListaCidades(viewModel: viewModel, viewActions: viewActions),
      ],
    );
  }
}
