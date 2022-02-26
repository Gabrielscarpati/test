import 'package:flutter/cupertino.dart';
import 'package:projeto_treinamento/features/pesquisaTipoServico/views/viewHeaderPesquisaTipoServico.dart';
import 'package:projeto_treinamento/features/pesquisaTipoServico/views/viewListaTipoServico.dart';

import '../viewActionsPesquisaTipoServico.dart';
import '../viewModelPesquisaTipoServico.dart';


class ViewPesquisaTipoServicoBody extends StatelessWidget {
  ViewPesquisaTipoServicoBody(
    BuildContext context, {
    Key? key,
    required this.viewModel,
    required this.viewActions,
  });

  final ViewModelPesquisaTipoServico viewModel;
  final ViewActionsPesquisaTipoServico viewActions;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: ViewHeaderPesquisaTipoServico(viewModel: viewModel, viewActions: viewActions),
        ),
        ViewListaTipoServico(viewModel: viewModel, viewActions: viewActions),
      ],
    );
  }
}
