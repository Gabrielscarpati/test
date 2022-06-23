import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:projeto_treinamento/features/infoPrestadorDeServico/viewModelInfoPrestadorDeServico.dart';
import 'package:projeto_treinamento/features/infoPrestadorDeServico/views/viewInfoPrestadorDeServicoDados.dart';
import 'package:projeto_treinamento/features/infoPrestadorDeServico/views/viewInfoPrestadorDeServicoHeader.dart';
import 'package:projeto_treinamento/providers/icone/providerIcone.dart';

import '../../../util/libraryComponents/colors/colors.dart';
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
    return Container(
      color: BackgroundColorGrey,
      child: Column(
        children: [
          ViewInfoPrestadorDeServicoDados(
            viewModel: viewModel,
            viewActions: viewActions,
          ),
          Expanded(
            child: ListViewListaAvaliacaoPrestadorDeServico(
              viewActions: viewActions,
              viewModel: viewModel,
            ),
          ),
        ],
      ),
    );
  }
}
