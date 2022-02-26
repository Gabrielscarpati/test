import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:projeto_treinamento/businessModels/businessModelTiposDeServico.dart';
import 'package:substring_highlight/substring_highlight.dart';

class listItemPesquisaTipoServico extends StatelessWidget {
  final BusinessModelTiposDeServico tipoServico;
  final String argumentoDePesquisa;

  const listItemPesquisaTipoServico({
    Key? key,
    required this.tipoServico,
    required this.argumentoDePesquisa,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        onTap: () {
          Navigator.of(context).pop(this.tipoServico.codTipoServico);
        },
        child: ListTile(
            hoverColor: Theme.of(context).cardTheme.shadowColor,
            title: SubstringHighlight(
              text: this.tipoServico.descricao,
              caseSensitive: false,
              overflow: TextOverflow.ellipsis,
              terms: [argumentoDePesquisa],
              textAlign: TextAlign.left,
              textStyleHighlight: TextStyle(
                color: Theme.of(context).colorScheme.primary,
                backgroundColor: Theme.of(context).textTheme.headline2!.backgroundColor,
              ),
              words: false,
            ),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(this.tipoServico.qtdePrestadoresDeServico.toString() + " Prestadores nessa cidade"),
                // ???
              ],
            ),
            leading: Icon(this.tipoServico.icone, color: Theme.of(context).iconTheme.color)),
      ),
    );
  }
}
