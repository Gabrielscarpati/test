import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:projeto_treinamento/features/infoPrestadorDeServico/viewModelInfoPrestadorDeServico.dart';
import 'package:projeto_treinamento/widgets/custom_rating_bar.dart';
import 'package:projeto_treinamento/widgets/linearPercentIndicator.dart';

import '../viewActionsInfoPrestadorDeServico.dart';

class ViewInfoPrestadorDeServicoDadosRating extends StatelessWidget {
  ViewInfoPrestadorDeServicoDadosRating({
    Key? key,
    required this.viewModel,
    required this.viewActions,
  });

  double alturaEntreAsAvaliacoes = 4;
  double tamanhoDoNumeroAvaliacoes = 8;
  double tamanhoDoNumeroQuantidadeDeAvaliacoes = 8;

  final ViewModelInfoPrestadorDeServico viewModel;
  final ViewActionsInfoPrestadorDeServico viewActions;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  this.viewModel.prestadorDeServicos.nota.toStringAsPrecision(2),
                  style: Theme.of(context).textTheme.headline6!.copyWith(fontWeight: FontWeight.bold, color: Theme.of(context).textTheme.headline5!.color, fontSize: 50),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 10.0),
                  child: Text(
                    " / 5",
                    style: Theme.of(context).textTheme.headline6!.copyWith(fontWeight: FontWeight.bold, color: Theme.of(context).textTheme.headline5!.color, fontSize: 20),
                  ),
                ),
              ],
            ),
            CustomRatingBar(
              rating: viewModel.prestadorDeServicos.nota,
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              viewModel.prestadorDeServicos.totalDeAvaliacoes.toString() + " avaliações",
              style: Theme.of(context).textTheme.headline6!.copyWith(fontWeight: FontWeight.bold, color: Theme.of(context).textTheme.caption!.color, fontSize: 12),
            ),
          ],
        ),
        SizedBox(
          width: 16,
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _barraDeAvaliacao(context, 5, viewModel.prestadorDeServicos.totalDeAvaliacoesNota5),
            SizedBox(
              height: alturaEntreAsAvaliacoes,
            ),
            _barraDeAvaliacao(context, 4, viewModel.prestadorDeServicos.totalDeAvaliacoesNota4),
            SizedBox(
              height: alturaEntreAsAvaliacoes,
            ),
            _barraDeAvaliacao(context, 3, viewModel.prestadorDeServicos.totalDeAvaliacoesNota3),
            SizedBox(
              height: alturaEntreAsAvaliacoes,
            ),
            _barraDeAvaliacao(context, 2, viewModel.prestadorDeServicos.totalDeAvaliacoesNota2),
            SizedBox(
              height: alturaEntreAsAvaliacoes,
            ),
            _barraDeAvaliacao(context, 1, viewModel.prestadorDeServicos.totalDeAvaliacoesNota1),
          ],
        ),
      ],
    );
  }

  Widget _barraDeAvaliacao(BuildContext context, int index, int totalDeAvaliacoesNota) {
    return Row(
      children: [
        Text(
          index.toString(),
          style: Theme.of(context).textTheme.headline6!.copyWith(fontWeight: FontWeight.bold, color: Theme.of(context).textTheme.caption!.color, fontSize: 16),
        ),
        SizedBox(
          width: 6,
        ),
        LienarPercentIndicatorWidget(
          rating:  (totalDeAvaliacoesNota / (viewModel.prestadorDeServicos.totalDeAvaliacoes == 0 ? 1:viewModel.prestadorDeServicos.totalDeAvaliacoes)),
          totalDeAvaliacoes: totalDeAvaliacoesNota,
        ),
        SizedBox(
          width: 6,
        ),
         SizedBox(
            width: 34,
            child: Text(
              (100 * totalDeAvaliacoesNota ~/ (viewModel.prestadorDeServicos.totalDeAvaliacoes == 0? 1:viewModel.prestadorDeServicos.totalDeAvaliacoes) ).toString() + "%",
              style: Theme.of(context).textTheme.headline6!.copyWith(fontWeight: FontWeight.bold, color: Theme.of(context).textTheme.caption!.color, fontSize: 16),
          ),
        ),
      ],
    );
  }
}
