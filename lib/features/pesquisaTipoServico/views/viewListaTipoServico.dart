import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../viewActionsPesquisaTipoServico.dart';
import '../viewModelPesquisaTipoServico.dart';
import 'listItemPesquisaTipoServico.dart';

class ViewListaTipoServico extends StatelessWidget {
  ViewListaTipoServico({
    Key? key,
    required this.viewModel,
    required this.viewActions,
  });

  final ViewModelPesquisaTipoServico viewModel;
  final ViewActionsPesquisaTipoServico viewActions;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: viewModel.listaVisivel.length,
      itemBuilder: (BuildContext context, int index) {
        return listItemPesquisaTipoServico(
          argumentoDePesquisa: viewModel.controlerFieldPesquisa.text,
          tipoServico: viewModel.listaVisivel[index],
        );
      }
      );
  }
}
