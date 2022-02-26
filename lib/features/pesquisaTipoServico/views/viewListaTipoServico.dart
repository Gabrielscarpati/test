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
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.only(top: 32, left: 32, right: 32),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Selecione o tipo de serviço:",
              style: Theme.of(context).textTheme.headline3!.copyWith(fontSize: Theme.of(context).textTheme.bodyText2!.fontSize),
            ),
            ListView.builder(
                shrinkWrap: true,
                itemCount: viewModel.listaVisivel.length,
                itemBuilder: (BuildContext context, int index) {
                  return listItemPesquisaTipoServico(
                    argumentoDePesquisa: viewModel.controlerFieldPesquisa.text,
                    tipoServico: viewModel.listaVisivel[index],
                  );
                }),
          ],
        ),
      ),
    );
  }
}
