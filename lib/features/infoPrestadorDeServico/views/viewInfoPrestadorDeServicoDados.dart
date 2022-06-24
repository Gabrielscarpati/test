import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/utils.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:projeto_treinamento/businessModels/businessModelIcone.dart';
import 'package:projeto_treinamento/features/infoPrestadorDeServico/viewModelInfoPrestadorDeServico.dart';
import 'package:projeto_treinamento/features/infoPrestadorDeServico/views/viewInfoPrestadorDeServicoDadosRating.dart';
import 'package:projeto_treinamento/util/libraryComponents/popUps/popUpWhatsAppNaoestaIntalado.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';
import '../viewActionsInfoPrestadorDeServico.dart';
import 'comentariosInfoPrestadorDeServico.dart';

class ViewInfoPrestadorDeServicoDados extends StatelessWidget {
  ViewInfoPrestadorDeServicoDados({
    Key? key,
    required this.viewModel,
    required this.viewActions,
  });

  final ViewModelInfoPrestadorDeServico viewModel;
  final ViewActionsInfoPrestadorDeServico viewActions;

  @override
  Widget build(BuildContext context) {

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


                                    child: _infoDoPrestadorDeServico(context, Icons.account_box, this.viewModel.tiposDeServico.descricao.toUpperCase()),
                                  )
                              ),
                              SizedBox(height: 6),
                              _infoDoPrestadorDeServico(context, Icons.description, 'DESCRIÇÃO'),
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
                            minHeight: 50,
                            minWidth: 100,
                            maxHeight: 206,
                            maxWidth: screnWidth*.92,
                          ),
                          child: Container(
                              child: Text(this.viewModel.prestadorDeServicos.description),
                          )
                      ),
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
          child: TextButton(onPressed: () => Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => ComentariosInfoPrestadorDeServico(viewModel: viewModel,),
            )).then((value) => viewActions.AtualizaTelaPrestadorDeServico(viewModel)) ,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(width: 1,),
                Text('Faça um comentário sobre esse prestador',
                style: TextStyle(color: Colors.black, fontSize: 16),),
                Icon(Icons.arrow_forward, color: Colors.black,),
                SizedBox(width: 1,),

              ],
            ),
          ),
        )
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
