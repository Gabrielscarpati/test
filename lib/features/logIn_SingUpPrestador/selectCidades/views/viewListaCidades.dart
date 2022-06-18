import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:substring_highlight/substring_highlight.dart';
import '../blocEventSelectCidade.dart';
import '../viewActionsSelectCidade.dart';
import '../viewModelSelectCidade.dart';

class ViewListSelectCity extends StatefulWidget {
  final ViewModelSelectCidade viewModel;
  final ViewActionsSelectCidade viewAction;


  ViewListSelectCity({
    required this.viewModel,
    required this.viewAction,

    Key? key,
  });

  @override
  State<ViewListSelectCity> createState() => _ViewListSelectCityState();
}


class _ViewListSelectCityState extends State<ViewListSelectCity> {

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        shrinkWrap: true,
        itemCount: widget.viewModel.listaVisivel.length,
        itemBuilder: (BuildContext context, int index) {
          return Card(
            color: widget.viewModel.cidadesSelecionadas
                    .contains(widget.viewModel.cidades[index])
                ? Colors.blue
                : Colors.white,
            child: ListTile(
                onTap: () {
                  widget.viewAction.selectCidade(context, widget.viewModel, index);
                },
                title: SubstringHighlight(
                      text: widget.viewModel.listaVisivel[index].nome,
                      caseSensitive: false,
                      overflow: TextOverflow.ellipsis,
                      term: widget.viewModel.controlerFieldPesquisa.text,
                      textAlign: TextAlign.left,
                      textStyleHighlight: TextStyle(
                        color: Theme.of(context).colorScheme.primary,
                        backgroundColor: Theme.of(context).textTheme.headline2!.backgroundColor,
                      ),
                      words: false,
                ),

                leading: Icon(Icons.location_city)),
          );
        });
  }
}
