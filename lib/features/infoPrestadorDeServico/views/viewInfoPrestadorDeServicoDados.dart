import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/utils.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:projeto_treinamento/businessModels/businessModelIcone.dart';
import 'package:projeto_treinamento/features/infoPrestadorDeServico/viewModelInfoPrestadorDeServico.dart';
import 'package:projeto_treinamento/features/infoPrestadorDeServico/views/viewInfoPrestadorDeServicoDadosRating.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';
import '../viewActionsInfoPrestadorDeServico.dart';

class ViewInfoPrestadorDeServicoDados extends StatelessWidget {
  ViewInfoPrestadorDeServicoDados({
    Key? key,
    required this.viewModel,
    required this.viewActions,
    required this.iconeCelular,
  });

  final ViewModelInfoPrestadorDeServico viewModel;
  final ViewActionsInfoPrestadorDeServico viewActions;
  final BusinessModelIcone iconeCelular;

  @override
  Widget build(BuildContext context) {
    String descricao = 'O Jusbrasil encontrou 2 processos de H. G. G. H. nos Diários Oficiais. Abrasil encontrou 2brasil encontrou 2 processos de H. G. G. H. nos Diáriobrasil encontrou 2 processos de H. G. G. H. nosbrasil encontrou 2 processos de H. G. G. H. nos Diários Oficiais. A maioria é do Tbrasil encontrou 2 processos de H. G. G.brasil encontrou 2 processos de H. G. G. H. nos Diários Oficiais. A maioria é do T H. nos Diários Oficiais. A maioria é do T Diários Oficiais. A maioria é do Ts Oficiais. A maioria é do T H. nos Diários Oficiais. A maioria é do T maioria é do TJSP, seguido por TRT18. Desses processos encontrados, Andre EduarA maioria é do TJSP, seguido por TRT18. Desses processos eA maioria é do TJSP, seguido por TRT18. Desses procA maioria é do TJSP, seguido por TRT18. Desses processos encontrados, Andre Eduardo Oliva foi a essos encontrados, Andre Eduardo Oliva foi a ncontrados, Andre Eduardo Oliva foi a do Oliva foi a parte que mais apareceu, seguido por Lara de Goes Salvetti.';

    double screnWidth = MediaQuery.of(context).size.width;
    return Column(
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
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            children: [
                              _infoDoPrestadorDeServico(context, Icons.location_on, this.viewModel.cidade.nome.toUpperCase()),
                              SizedBox(height: 6),
                              _infoDoPrestadorDeServico(context, Icons.phone, this.viewModel.prestadorDeServicos.telefone),
                              SizedBox(height: 6),
                              ConstrainedBox(
                                  constraints:  BoxConstraints(
                                    maxHeight: 70,
                                    maxWidth: screnWidth*.60,
                                  ),
                                  child: Container(


                                    //VER PQ TA DANDO ERRO . . .. . .


                                    child: _infoDoPrestadorDeServico(context, Icons.account_box, this.viewModel.tiposDeServico.descricao.toUpperCase()+' pedreiro'),
                                  )
                              ),
                              SizedBox(height: 6),
                              _infoDoPrestadorDeServico(context, Icons.description, 'DESCRICAO:'),
                              SizedBox(height: 6),

                            ],
                          ),
                          Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(right: 16.0, top: 16.0, bottom: 16.0),
                                child: Hero(
                                  tag: viewModel.prestadorDeServicos.codPrestadorServico,
                                  child: CircleAvatar(
                                    backgroundColor: Colors.white,
                                    foregroundColor: Colors.black,
                                    backgroundImage: NetworkImage(this.viewModel.prestadorDeServicos.urlFoto),
                                    radius: 40.0,
                                    child: Text("", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0)),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                      ConstrainedBox(
                          constraints:  BoxConstraints(
                            minHeight: 100,
                            minWidth: 100,
                            maxHeight: 206,
                            maxWidth: screnWidth*.92,
                          ),

                          child: Container(
                              child: Text(descricao),
                          )
                      ),
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
                            child: ViewInfoPrestadorDeServicoDadosRating(
                              viewActions: this.viewActions,
                              viewModel: this.viewModel,
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
        Card(
          child: _botoes(context),
        ),
      ],
    );
  }

  Widget _infoDoPrestadorDeServico(BuildContext context, IconData iconData, String texto) {
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

  Widget _botoes(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
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
                openwhatsapp();
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

  openwhatsapp() async{

    var whatsapp ="+55${this.viewModel.prestadorDeServicos.telefone}";
    var whatsappURl_android = "whatsapp://send?phone="+whatsapp+"&text=";
    var whatappURL_ios ="https://wa.me/$whatsapp?text=${Uri.parse("hello")}";
    if(GetPlatform.isIOS){
      // for iOS phone only
      if( await canLaunchUrlString(whatappURL_ios)){
        await launchUrlString(whatappURL_ios);
      }else{
        print('WhatsApp n installado');
      }

    }else{
      // android , web
      if( await canLaunchUrlString(whatsappURl_android)){
        await launchUrlString(whatsappURl_android);
      }else{
        print('WhatsApp n installado');
        /*ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: new Text("whatsapp no installed")));*/
      }
    }
  }
}
