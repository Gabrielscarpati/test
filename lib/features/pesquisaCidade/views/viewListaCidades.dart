import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:projeto_treinamento/features/pesquisaCidade/viewModelPesquisaCidade.dart';
import 'package:projeto_treinamento/features/pesquisaCidade/views/listItemPesquisaCidades.dart';

import '../viewActionsPesquisaCidade.dart';

class ViewListaCidades extends StatelessWidget {
  ViewListaCidades({
    Key? key,
    required this.viewModel,
    required this.viewActions,
  });

  final ViewModelPesquisaCidade viewModel;
  final ViewActionsPesquisaCidade viewActions;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.only(top: 32, left: 32, right: 32),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Selecione a sua cidade:",
              style: Theme.of(context).textTheme.headline3!.copyWith(fontSize: Theme.of(context).textTheme.bodyText2!.fontSize),
            ),
            ListView.builder(
                shrinkWrap: true,
                itemCount: viewModel.listaVisivel.length,
                itemBuilder: (BuildContext context, int index) {
                  return listItemPesquisaCidades(
                    argumentoDePesquisa: viewModel.controlerFieldPesquisa.text,
                    iconeCidade: viewModel.iconeCidade,
                    cidade: viewModel.listaVisivel[index].cidade,
                    quantidadeDePrestadores: viewModel.listaVisivel[index].cidade.totalPrestadoresServico,
                  );
                }),
          ],
        ),
      ),
    );
  }
}
