import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:projeto_treinamento/features/hubPrestador/presenterHub.dart';
import 'package:substring_highlight/substring_highlight.dart';
import '../viewActionsPesquisaCidade.dart';
import '../viewModelPesquisaCidade.dart';

class ViewListaPesquisaCidade extends StatefulWidget {
  final ViewModelPesquisaCidade viewModel;
  final ViewActionsPesquisaCidade viewAction;
  ViewListaPesquisaCidade({
    required this.viewModel,
    required this.viewAction,
    Key? key,
  });

  @override
  State<ViewListaPesquisaCidade> createState() => _ViewListaPesquisaCidade();
}

class _ViewListaPesquisaCidade extends State<ViewListaPesquisaCidade> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        shrinkWrap: true,
        itemCount: widget.viewModel.listaVisivel.length,
        itemBuilder: (BuildContext context, int index) {
          return Card(
            child: ListTile(
                onTap: () {
                  Navigator.of(context)
                      .pop(widget.viewModel.listaVisivel[index].cidade.nome);
                },
                title: SubstringHighlight(
                  text: widget.viewModel.listaVisivel[index].cidade.nome,
                  caseSensitive: false,
                  overflow: TextOverflow.ellipsis,
                  term: widget.viewModel.controlerFieldPesquisa.text,
                  textAlign: TextAlign.left,
                  textStyleHighlight: TextStyle(
                    color: Theme.of(context).colorScheme.primary,
                    backgroundColor:
                        Theme.of(context).textTheme.headline2!.backgroundColor,
                  ),
                  words: false,
                ),
                leading: Icon(Icons.location_city)),
          );
        });
  }
}
