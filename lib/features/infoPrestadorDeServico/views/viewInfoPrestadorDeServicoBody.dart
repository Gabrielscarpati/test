import 'package:flutter/cupertino.dart';
import 'package:projeto_treinamento/features/infoPrestadorDeServico/viewModelInfoPrestadorDeServico.dart';
import 'package:projeto_treinamento/features/infoPrestadorDeServico/views/viewInfoPrestadorDeServicoDados.dart';
import 'package:projeto_treinamento/features/infoPrestadorDeServico/views/viewInfoPrestadorDeServicoHeader.dart';
import 'package:projeto_treinamento/providers/icone/providerIcone.dart';

import '../viewActionsInfoPrestadorDeServico.dart';
import 'listViewListaAvaliacoesPrestadorDeServico.dart';

class ViewInfoPrestadorDeServicoBody extends StatelessWidget {
  ViewInfoPrestadorDeServicoBody({
    Key? key,
    required this.viewModel,
    required this.viewActions,
  });

  final ViewModelInfoPrestadorDeServico viewModel;
  final ViewActionsInfoPrestadorDeServico viewActions;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ViewInfoPrestadorDeServicoDados(
          viewModel: viewModel,
          viewActions: viewActions,
          iconeCelular: viewModel.iconeCelular,
        ),
        Expanded(
          child: ListViewListaAvaliacaoPrestadorDeServico(
            viewActions: viewActions,
            viewModel: viewModel,
          ),
        ), //    ViewHubUsuario(viewModel: viewModel, viewActions: viewActions),
        //    ViewHubCidade(viewModel: viewModel, viewActions: viewActions),
        //    ViewHubServicos(viewModel: viewModel, viewActions: viewActions),
      ],
    );
  }
}
