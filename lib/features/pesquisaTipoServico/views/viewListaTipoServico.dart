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
        padding: const EdgeInsets.only(top: 4, left: 4, right: 4),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Card(
              child: Padding(
                padding: const EdgeInsets.all(2.0),
                child: Text(
                  "Selecione o tipo de serviço:",
                  style: Theme.of(context).textTheme.headline3!.copyWith(
                      fontSize:
                          Theme.of(context).textTheme.bodyText2!.fontSize),
                ),
              ),
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
