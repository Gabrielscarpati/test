import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:projeto_treinamento/businessModels/businessModelDadosPrestador.dart';
import 'package:projeto_treinamento/businessModels/businessModelUsuario.dart';

import '../viewActionsHub.dart';
import '../viewModelHub.dart';

class ViewHubTipoServico extends StatelessWidget {
  ViewHubTipoServico({
    Key? key,
    required this.viewModel,
    required this.viewActions,
  });

  final ViewModelHubPrestador viewModel;
  final ViewActionsHubPrestador viewActions;

  @override
  Widget build(BuildContext context) {
    /*if (viewModel.cidade.codCidade == 0) {
      return SizedBox.shrink();
    }*/

    return Padding(
      padding: const EdgeInsets.only(top: 12, left: 16, right: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ListView(
                // This next line does the trick.
                scrollDirection: Axis.horizontal,
                children: List<Widget>.generate(viewModel.tiposDeServico.length,
                    (int index) {
                  return Chip(
                    backgroundColor: Colors.white,
                    label: Text(viewModel.tiposDeServico[index].descricao),
                  );
                }),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
