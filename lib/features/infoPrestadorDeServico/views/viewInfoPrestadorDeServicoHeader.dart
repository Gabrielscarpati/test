import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:projeto_treinamento/features/infoPrestadorDeServico/viewModelInfoPrestadorDeServico.dart';

import '../viewActionsInfoPrestadorDeServico.dart';

class ViewInfoPrestadorDeServicoHeader extends StatelessWidget {
  ViewInfoPrestadorDeServicoHeader({
    Key? key,
    required this.viewModel,
    required this.viewActions,
  });

  final ViewModelInfoPrestadorDeServico viewModel;
  final ViewActionsInfoPrestadorDeServico viewActions;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(viewModel.prestadorDeServicos.nome,
          style: TextStyle(color: Colors.white),
        ),
      ],
    );
  }
}
