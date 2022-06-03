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
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                CircleAvatar(
                  child: Text(
                    "J",
                    style: TextStyle(color: Colors.black87),
                  ),
                  backgroundColor: Colors.grey,
                ),
                SizedBox(width: 16),
                Text(avaliacao.id),
              ],
            ),
            SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                CustomRatingBar(
                  rating: avaliacao.nota,
                ),
                SizedBox(width: 8),
                Text(
                  avaliacao.data,
                  style: Theme.of(context).textTheme.caption,
                ),
              ],
            ),
            SizedBox(height: 8),
            Text(
              avaliacao.comentario,
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
}
