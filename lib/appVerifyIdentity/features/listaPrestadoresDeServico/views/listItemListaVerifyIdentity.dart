import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:projeto_treinamento/widgets/custom_rating_bar.dart';
import 'package:substring_highlight/substring_highlight.dart';
import '../../../businessModel/businessModelVerifyIdentity.dart';
import '../viewActionsListaVerifyIdentity.dart';
import '../viewModelListaVerifyIdentity.dart';


class ListItemListaVerifyIdentity extends StatelessWidget {
  final BusinessModelVerifyIdentity prestradorDeServico;
  //final IconData iconeStatusOnline;
  final String argumentoDePesquisa;
  final ViewActionsListaVerifyIdentity viewActions;
  final ViewModelListaVerifyIdentity viewModel;
  const ListItemListaVerifyIdentity({
    Key? key,
    required this.prestradorDeServico,
    //required this.iconeStatusOnline,
    required this.argumentoDePesquisa,
    required this.viewActions,
    required this.viewModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        onTap: () async{
          this.viewActions.abreTelaInfoVerifyIdentityo(context, this.viewModel, this.prestradorDeServico);
        },
        child: ListTile( //CircularProgressIndicatorSmall

          leading:Hero(
            tag: prestradorDeServico.IdPrestador,
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
                backgroundImage: NetworkImage(prestradorDeServico.profilePicture),
                radius: 28.0,
                child: Text("",
                    style: TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 20.0)),
              ),
            ),
          ),

          title: SubstringHighlight(
            text: prestradorDeServico.name,
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
              Text(prestradorDeServico.phone),
              // ???
            ],
          ),
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              /*CustomRatingBar(
                rating: prestradorDeServico.,
              ),*/
              SizedBox(width: 5),
             // Text("(" + prestradorDeServico.totalDeAvaliacoes.toString() + ")"),
              SizedBox(width: 20),
            //  prestradorDeServico.statusOnline ? Icon(this.iconeStatusOnline, color: Colors.green) : Icon(this.iconeStatusOnline, color: Colors.red),
            ],
          ),
        ),
      ),
    );
  }
}
