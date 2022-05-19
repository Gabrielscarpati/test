import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:projeto_treinamento/businessModels/businessModelCidade.dart';
import 'package:projeto_treinamento/businessModels/businessModelIcone.dart';
import 'package:substring_highlight/substring_highlight.dart';

class listItemPesquisaCidadesa extends StatelessWidget {
  final List? listaVazia;
  final String cidade;
  final Icon iconeCidade;
  //final String argumentoDePesquisa;
  final int quantidadeDePrestadores;

  const listItemPesquisaCidadesa({
    Key? key,
    this.listaVazia,
    required this.cidade,
    required this.iconeCidade,
    //required this.argumentoDePesquisa,
    required this.quantidadeDePrestadores,
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    List cidades = ['aaa','bbbb','cccc','dddd','eeee','ffff','ggggg','hhhh','aaa','bbbb','cccc','dddd','eeee','ffff','ggggg','hhhh'];
    List listaVazia = [];

    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: InkWell(
        onTap: () {
          print('hahhhhhjhjhja');
          listaVazia.add('value');

         // Navigator.of(context).pop(this.cidade.codCidade);
        },
        child: ListTile(
          trailing: Icon(Icons.check_box),
            hoverColor: Theme.of(context).cardTheme.shadowColor,
            title: SubstringHighlight(
              text: cidades[1],
              caseSensitive: false,
              overflow: TextOverflow.ellipsis,
              terms: ['argumentoDePesquisa'],
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
                Text(/*quantidadeDePrestadores.toString()*/ '20' + " Prestadores nessa cidade"),

              ],
            ),
            leading: Icon(Icons.location_city)
            //Icon(this.iconeCidade.icone, color: Theme.of(context).iconTheme.color)),
        ),
      ),
    );
  }
}
