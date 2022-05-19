import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:projeto_treinamento/businessModels/businessModelCidade.dart';
import 'package:projeto_treinamento/businessModels/businessModelIcone.dart';
import 'package:substring_highlight/substring_highlight.dart';

class listItemPesquisaCidades extends StatelessWidget {
  final BusinessModelCidade cidade;
  final BusinessModelIcone iconeCidade;
  final String argumentoDePesquisa;
  final int quantidadeDePrestadores;

  const listItemPesquisaCidades({
    Key? key,
    required this.cidade,
    required this.iconeCidade,
    required this.argumentoDePesquisa,
    required this.quantidadeDePrestadores,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: InkWell(
        onTap: () {
          Navigator.of(context).pop(this.cidade.codCidade);
        },
        child: ListTile(
            hoverColor: Theme.of(context).cardTheme.shadowColor,
            title: SubstringHighlight(
              text: cidade.nome,
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
                Text(quantidadeDePrestadores.toString() + " Prestadores nessa cidade"),

              ],
            ),
            leading: Icon(this.iconeCidade.icone, color: Theme.of(context).iconTheme.color)),
      ),
    );
  }
}

