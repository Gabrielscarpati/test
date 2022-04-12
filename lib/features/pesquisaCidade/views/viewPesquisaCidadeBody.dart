import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:projeto_treinamento/features/pesquisaCidade/viewModelPesquisaCidade.dart';
import 'package:projeto_treinamento/features/pesquisaCidade/views/viewHeaderPesquisaCidade.dart';
import 'package:projeto_treinamento/features/pesquisaCidade/views/viewListaCidades.dart';

import '../../../util/libraryComponents/colors/colors.dart';
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
    return Container(
      color: BackgroundColorGrey,
      child: Column(
        children: [
          Card(
            borderOnForeground: true,
            child: Padding(
                padding: const EdgeInsets.all(8),
                child: ViewHeaderPesquisaCidade(viewModel: viewModel, viewActions: viewActions),
              ),
            ),
          ViewListaCidades(viewModel: viewModel, viewActions: viewActions),
        ],
      ),
    );
  }
}
