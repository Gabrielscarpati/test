import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:projeto_treinamento/features/hubPrestador/viewModelHub.dart';

import '../../../util/libraryComponents/circularProgressIndicatorPersonalizado.dart';
import '../../../util/libraryComponents/colors/colors.dart';
import '../../../widgets/custom_rating_bar.dart';
import '../../../widgets/linearPercentIndicator.dart';
import '../viewActionsHub.dart';

class ViewHubPrestadorInfoPrestador  extends StatelessWidget {
  final ViewModelHubPrestador viewModel;
  final ViewActionsHubPrestador viewActions;
  const ViewHubPrestadorInfoPrestador ({Key? key,
    required this.viewModel,
    required this.viewActions
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double? alturaEntreAsAvaliacoes = 4;

    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        titleSpacing: 0,
        // automaticallyImplyLeading: false,
        title: viewModel == null
            ? CircularProgressIndicatorPersonalizado()
            : Text(viewModel.prestadorDeServicos.nome, style: TextStyle(color: Colors.white)),
        backgroundColor: ColorAppBar,
        iconTheme: IconThemeData(
          color: Colors.white,
        ),
      ),
      body: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Card(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment:
                        MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            children: [
                              SizedBox(height: 6),
                              _infoDoPrestadorDeServico(
                                  context,
                                  Icons.phone,
                                  this.viewModel.prestador.phone),
                              SizedBox(height: 6),
                              ConstrainedBox(
                                  constraints: BoxConstraints(
                                    maxHeight: 70,
                                    maxWidth: MediaQuery.of(context)
                                        .size
                                        .width *
                                        .60,
                                  ),
                                  child: Container(
                                    //VER PQ TA DANDO ERRO . . .. . .


                                  )),
                              SizedBox(height: 6),
                              _infoDoPrestadorDeServico(context,
                                  Icons.description, 'DESCRIÇÃO'),
                              SizedBox(height: 6),
                            ],
                          ),
                          Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(
                                    right: 16.0,
                                    top: 16.0,
                                    bottom: 16.0),
                                child: Hero(
                                  tag: viewModel
                                      .prestador.IdPrestador,
                                  child: CircleAvatar(
                                    backgroundColor: Colors.white,
                                    foregroundColor: Colors.black,
                                    backgroundImage: NetworkImage(
                                        this
                                            .viewModel
                                            .prestador
                                            .profilePicture),
                                    radius: 40.0,
                                    child: Text("",
                                        style: TextStyle(
                                            fontWeight:
                                            FontWeight.bold,
                                            fontSize: 20.0)),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                      ConstrainedBox(
                          constraints: BoxConstraints(
                            minHeight: 50,
                            minWidth: 100,
                            maxHeight: 206,
                            maxWidth:
                            MediaQuery.of(context).size.width *
                                .92,
                          ),
                          child: Container(
                            child: Text(this
                                .viewModel
                                .prestador
                                .description),
                          )),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        Card(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                            child: Row(
                              mainAxisAlignment:
                              MainAxisAlignment.spaceEvenly,
                              children: [
                                Column(
                                  crossAxisAlignment:
                                  CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment.end,
                                      crossAxisAlignment:
                                      CrossAxisAlignment.end,
                                      children: [
                                        Text(
                                          this
                                              .viewModel
                                              .prestadorDeServicos
                                              .nota
                                              .toStringAsPrecision(
                                              2),
                                          style: Theme.of(context)
                                              .textTheme
                                              .headline6!
                                              .copyWith(
                                              fontWeight:
                                              FontWeight
                                                  .bold,
                                              color: Theme.of(
                                                  context)
                                                  .textTheme
                                                  .headline5!
                                                  .color,
                                              fontSize: 50),
                                        ),
                                        Padding(
                                          padding:
                                          const EdgeInsets.only(
                                              bottom: 10.0),
                                          child: Text(
                                            " / 5",
                                            style: Theme.of(context)
                                                .textTheme
                                                .headline6!
                                                .copyWith(
                                                fontWeight:
                                                FontWeight
                                                    .bold,
                                                color: Theme.of(
                                                    context)
                                                    .textTheme
                                                    .headline5!
                                                    .color,
                                                fontSize: 20),
                                          ),
                                        ),
                                      ],
                                    ),
                                    CustomRatingBar(
                                      rating: viewModel
                                          .prestadorDeServicos.nota,
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Text(
                                      viewModel.prestadorDeServicos
                                          .totalDeAvaliacoes
                                          .toString() +
                                          " avaliações",
                                      style: Theme.of(context)
                                          .textTheme
                                          .headline6!
                                          .copyWith(
                                          fontWeight:
                                          FontWeight.bold,
                                          color:
                                          Theme.of(context)
                                              .textTheme
                                              .caption!
                                              .color,
                                          fontSize: 12),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  width: 16,
                                ),
                                Column(
                                  mainAxisAlignment:
                                  MainAxisAlignment
                                      .spaceBetween,
                                  children: [
                                    _barraDeAvaliacao(
                                        context,
                                        5,
                                        viewModel
                                            .prestadorDeServicos
                                            .totalDeAvaliacoesNota5),
                                    SizedBox(
                                      height:
                                      alturaEntreAsAvaliacoes,
                                    ),
                                    _barraDeAvaliacao(
                                        context,
                                        4,
                                        viewModel
                                            .prestadorDeServicos
                                            .totalDeAvaliacoesNota4),
                                    SizedBox(
                                      height:
                                      alturaEntreAsAvaliacoes,
                                    ),
                                    _barraDeAvaliacao(
                                        context,
                                        3,
                                        viewModel
                                            .prestadorDeServicos
                                            .totalDeAvaliacoesNota3),
                                    SizedBox(
                                      height:
                                      alturaEntreAsAvaliacoes,
                                    ),
                                    _barraDeAvaliacao(
                                        context,
                                        2,
                                        viewModel
                                            .prestadorDeServicos
                                            .totalDeAvaliacoesNota2),
                                    SizedBox(
                                      height:
                                      alturaEntreAsAvaliacoes,
                                    ),
                                    _barraDeAvaliacao(
                                        context,
                                        1,
                                        viewModel
                                            .prestadorDeServicos
                                            .totalDeAvaliacoesNota1),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
      ),
    );
  }
  Widget _infoDoPrestadorDeServico(
      BuildContext context, IconData iconData, String texto) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.60,
      child: Row(
        children: [
          Icon(iconData),
          SizedBox(
            width: 8,
          ),
          Text(
            texto,
            textAlign: TextAlign.justify,
            style: Theme.of(context).textTheme.caption,
          ),
        ],
      ),
    );
  }
  Widget _barraDeAvaliacao(
      BuildContext context, int index, int totalDeAvaliacoesNota) {
    return Row(
      children: [
        Text(
          index.toString(),
          style: Theme.of(context).textTheme.headline6!.copyWith(
              fontWeight: FontWeight.bold,
              color: Theme.of(context).textTheme.caption!.color,
              fontSize: 16),
        ),
        SizedBox(
          width: 6,
        ),
        LienarPercentIndicatorWidget(
          rating: (totalDeAvaliacoesNota /
              (viewModel.prestadorDeServicos.totalDeAvaliacoes == 0
                  ? 1
                  : viewModel.prestadorDeServicos.totalDeAvaliacoes)),
          totalDeAvaliacoes: totalDeAvaliacoesNota,
        ),
        SizedBox(
          width: 6,
        ),
        SizedBox(
          width: 34,
          child: Text(
            (100 *
                totalDeAvaliacoesNota ~/
                (viewModel.prestadorDeServicos.totalDeAvaliacoes == 0
                    ? 1
                    : viewModel.prestadorDeServicos.totalDeAvaliacoes))
                .toString() +
                "%",
            style: Theme.of(context).textTheme.headline6!.copyWith(
                fontWeight: FontWeight.bold,
                color: Theme.of(context).textTheme.caption!.color,
                fontSize: 16),
          ),
        ),
      ],
    );
  }
}
