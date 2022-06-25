import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_utils/src/platform/platform.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:projeto_treinamento/businessModels/businessModelAvaliacaoPrestadorDeServico.dart';
import 'package:projeto_treinamento/features/hubPrestador/viewModelHub.dart';
import 'package:url_launcher/url_launcher_string.dart';

import '../../../util/libraryComponents/circularProgressIndicatorPersonalizado.dart';
import '../../../util/libraryComponents/colors/colors.dart';
import '../../../util/libraryComponents/popUps/popUpWhatsAppNaoestaIntalado.dart';
import '../../../widgets/custom_rating_bar.dart';
import '../../../widgets/linearPercentIndicator.dart';
import '../viewActionsHub.dart';

class ViewHubPrestadorInfoPrestador  extends StatelessWidget {
  final ViewModelHubPrestador viewModel;
  final ViewActionsHubPrestador viewActions;
  const ViewHubPrestadorInfoPrestador ({Key? key,
    required this.viewModel,
    required this.viewActions,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double? alturaEntreAsAvaliacoes = 4;
    double _screenWidth = MediaQuery.of(context).size.width;


    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        titleSpacing: 0,
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
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    children: [
                                      _infoDoPrestadorDeServico(context, Icons.location_on, this.viewModel.prestadorDeServicos.cidades.toString().toUpperCase()),
                                      SizedBox(height: 6),
                                      _infoDoPrestadorDeServico(context, Icons.phone, this.viewModel.prestadorDeServicos.telefone),
                                      SizedBox(height: 6),
                                      ConstrainedBox(
                                          constraints:  BoxConstraints(
                                            maxHeight: 1000,
                                            maxWidth: _screenWidth*.60,
                                          ),
                                          child: Container(


                                            //VER PQ TA DANDO ERRO . . .. . .


                                            child: _infoDoPrestadorDeServico(context, Icons.account_box, this.viewModel.prestadorDeServicos.servicos.toString()),
                                          )
                                      ),
                                      SizedBox(height: 6),
                                      _infoDoPrestadorDeServico(context, Icons.description, 'DESCRIÇÃO'),
                                      SizedBox(height: 6),
                                    ],
                                  ),
                                ],
                              ),
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
                      _botoes(context),
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

  Widget _botoes(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            width: 140,
            child: ElevatedButton(
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Color(0xff9e9e9e)),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50.0),
                      ))),
              onPressed: () {
                launchUrlString('tel:+55 ${this.viewModel.prestadorDeServicos.telefone}');
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Icon(Icons.phone, color: Colors.white),
                  Text("Ligar", style: TextStyle(color: Colors.white)),
                ],
              ),
            ),
          ),
          SizedBox(
            // Colors.greenAccent
            width: 140,
            child: ElevatedButton(
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Color(0xff006400)),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50.0),
                      ))),
              onPressed: () async {
                openwhatsapp(context);
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Icon(MdiIcons.whatsapp, color: Colors.white),
                  Text("Whatsapp", style: TextStyle(color: Colors.white)),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

/*
  Widget listaComentarios(BuildContext context) {
    String month = avaliacao.data.substring(5,7);
    String ano = avaliacao.data.substring(0,4);
    String dia = avaliacao.data.substring(8,10);
    String horaMinSegundo = avaliacao.data.substring(11,20);
    double screenWidth = MediaQuery.of(context).size.width;

    return  Card(
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
                    avaliacao.emailUsuario[0].toUpperCase(),
                    style: TextStyle(color: Colors.black87),
                  ),
                  backgroundColor: Colors.grey,
                ),
                SizedBox(width: 16),
                Text(avaliacao.emailUsuario),
                SizedBox(width: 16,),
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
*/



  openwhatsapp(context) async{

    var whatsapp ="+55${this.viewModel.prestadorDeServicos.telefone}";
    var whatsappURl_android = "whatsapp://send?phone="+whatsapp+"&text=";
    var whatappURL_ios ="https://wa.me/$whatsapp?text=${Uri.parse("hello")}";
    if(GetPlatform.isIOS){
      // for iOS phone only
      if( await canLaunchUrlString(whatappURL_ios)){
        await launchUrlString(whatappURL_ios);
      }else{
        whatsAppNaoIntalado(context);
      }

    }else{
      // android , web
      if( await canLaunchUrlString(whatsappURl_android)){
        await launchUrlString(whatsappURl_android);
      }else{
        whatsAppNaoIntalado(context);
      }
    }
  }
  Future whatsAppNaoIntalado(context) => showDialog(
    context: context,
    builder: (context) => PopUpWhatsAppNaoEstaIntalado(),
  );
}
