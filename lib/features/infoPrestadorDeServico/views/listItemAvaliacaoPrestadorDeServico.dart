import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:projeto_treinamento/businessModels/businessModelAvaliacaoPrestadorDeServico.dart';
import 'package:projeto_treinamento/framework/viewActions.dart';
import 'package:projeto_treinamento/widgets/custom_rating_bar.dart';

class ListItemAvaliacaoPrestadorDeServico extends StatelessWidget {
  final ViewActions viewActions;
  final BusinessModelAvaliacaoPrestadorDeServico avaliacao;

  const ListItemAvaliacaoPrestadorDeServico({
    Key? key,
    required this.viewActions,
    required this.avaliacao,
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    String month = avaliacao.data.substring(5,7);
    String ano = avaliacao.data.substring(0,4);
    String dia = avaliacao.data.substring(8,10);
    String horaMinSegundo = avaliacao.data.substring(11,20);
    double screenWidth = MediaQuery.of(context).size.width;

    return  Card(
          child: Padding(
           padding: const EdgeInsets.all(6.0),
           child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  CircleAvatar(
                    child: Text(
                      avaliacao.emailUsuario[0].toUpperCase(),
                      style: TextStyle(color: Colors.black87),
                    ),
                    backgroundColor: Colors.grey,
                  ),
                  SizedBox(width: 12),
                  Expanded(child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(avaliacao.emailUsuario),
                    ],
                  )),
                  SizedBox(width: 12,),
                  CustomRatingBar(
                    rating: avaliacao.nota.toDouble(),
                  ),
                ],
              ),
              SizedBox(height: 8),

                  SizedBox(width: 8),
              ConstrainedBox(
                  constraints:  BoxConstraints(
                    minHeight: 10,
                    minWidth: 100,
                    maxHeight: 206,
                    maxWidth: screenWidth*.90,
                  ),

                  child: Container(
                    child: Text(avaliacao.comentario,
                      style: Theme.of(context).textTheme.caption,),
                  )
              ),
              SizedBox(height: 8),
              Text(
                dia+' de '+getMonth(month)+' de '+ano+ ' às '+horaMinSegundo,
                overflow: TextOverflow.ellipsis,
                softWrap: false,
                maxLines: 20,
                textAlign: TextAlign.justify,
                style: Theme.of(context).textTheme.caption,
              )
            ],
          ),
        ),
      );
    }
  String getMonth(String month){
    if(month == '01') return 'Janeiro';
    if(month == '02') return 'Fevereiro';
    if(month == '03') return 'Março';
    if(month == '04') return 'Abril';
    if(month == '05') return 'Maio';
    if(month == '06') return 'Junho';
    if(month == '07') return 'Julho';
    if(month == '08') return 'Agosto';
    if(month == '09') return 'Setembro';
    if(month == '10') return 'Outubro';
    if(month == '11') return 'Novembro';
    if(month == '12') return 'Dezembro';
    return 'Agosto';
  }
}
