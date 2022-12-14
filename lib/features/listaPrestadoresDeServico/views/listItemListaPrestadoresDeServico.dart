import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:projeto_treinamento/businessModels/businessModelIcone.dart';
import 'package:projeto_treinamento/businessModels/businessModelPrestadorDeServicos.dart';
import 'package:projeto_treinamento/features/listaPrestadoresDeServico/viewActionsListaPrestadoresDeServico.dart';
import 'package:projeto_treinamento/features/listaPrestadoresDeServico/viewModelListaPrestadoresDeServico.dart';
import 'package:projeto_treinamento/widgets/custom_rating_bar.dart';
import 'package:substring_highlight/substring_highlight.dart';

import '../../../daos/firebase/updatePrestadorFirebase.dart';

class ListItemListaPrestadoresDeServico extends StatelessWidget {
  final BusinessModelPrestadorDeServicos prestradorDeServico;
  //final IconData iconeStatusOnline;
  final String argumentoDePesquisa;
  final ViewActionsListaPrestadoresDeServico viewActions;
  final ViewModelListaPrestadoresDeServico viewModel;
  const ListItemListaPrestadoresDeServico({
    Key? key,
    required this.prestradorDeServico,
    //required this.iconeStatusOnline,
    required this.argumentoDePesquisa,
    required this.viewActions,
    required this.viewModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    UpdateNumerosDeVisitasPerfil updateNumerosDeVisitasPerfil = UpdateNumerosDeVisitasPerfil(idPrestador: prestradorDeServico.id);
    return Card(
      child: InkWell(
        onTap: () async{

          await updateNumerosDeVisitasPerfil.aumentarUmVisitas();
          this.viewActions.abreTelaInfoPrestadorDeServico(context, this.viewModel, this.prestradorDeServico);
        },
        child: ListTile(
          leading: Hero(
            tag: prestradorDeServico.codPrestadorServico,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                      blurRadius: 1, color: Colors.grey, spreadRadius: 1)
                ],
              ),
              child: CircleAvatar(
                backgroundColor: Colors.white,
                foregroundColor: Colors.black,
                backgroundImage: NetworkImage(prestradorDeServico.urlFoto),
                radius: 26.0,
                child: Text("",
                    style: TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 20.0)),
              ),
            ),
          ),
          title: SubstringHighlight(
            text: prestradorDeServico.nome,
            caseSensitive: false,
            overflow: TextOverflow.ellipsis,
            terms: [argumentoDePesquisa],
            textAlign: TextAlign.left,
            textStyleHighlight: TextStyle(
              color: Colors.black,
              backgroundColor: Colors.yellow,
            ),
            words: false,
          ),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(prestradorDeServico.telefone),
              // ???
            ],
          ),
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              CustomRatingBar(
                rating: prestradorDeServico.nota,
              ),
              SizedBox(width: 5),
              Text("(" + prestradorDeServico.totalDeAvaliacoes.toString() + ")"),
              SizedBox(width: 20),
            //  prestradorDeServico.statusOnline ? Icon(this.iconeStatusOnline, color: Colors.green) : Icon(this.iconeStatusOnline, color: Colors.red),
            ],
          ),
        ),
      ),
    );
  }
}
