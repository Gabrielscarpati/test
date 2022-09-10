import 'package:dio/dio.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:gallery_saver/gallery_saver.dart';
import 'package:path_provider/path_provider.dart';
import 'package:projeto_treinamento/appVerifyIdentity/features/infoPrestadorDeServico/views/viewBotaoAlterarSatatus.dart';
import 'package:projeto_treinamento/util/libraryComponents/popUps/popUpWhatsAppNaoestaIntalado.dart';
import '../../../businessModel/businessModelVerifyIdentity.dart';
import 'dart:io';

class ViewInfoVerifyIdentityDados extends StatelessWidget {
  ViewInfoVerifyIdentityDados({
    Key? key,
    required this.prestador,
  });

  final BusinessModelVerifyIdentity prestador;

  @override
  Widget build(BuildContext context) {
    String cidades = "";
    prestador.city.forEach((elem) {
      cidades = cidades + " " + elem;
    });
/*    String tiposServico = "";
    prestador.roles.forEach((element) {
      tiposServico = tiposServico + " " + element.descricao;
    });*/
    double screnWidth = MediaQuery.of(context).size.width;
    return Column(
      children: [
        Card(
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
                              _infoDoPrestadorDeServicoCidadeServico(context,
                                  Icons.location_on, cidades ),
                              SizedBox(height: 6),
                              _infoDoPrestadorDeServico(context, Icons.calendar_today, this.prestador.dataAberturaConta.toString()),
                              SizedBox(height: 6),
                              _infoDoPrestadorDeServico(context, Icons.calendar_today, this.prestador.tipoPlanoPrestador.toString()),


                              SizedBox(height: 6),
                              _infoDoPrestadorDeServico(context, Icons.phone, this.prestador.phone.toString()),
                              SizedBox(height: 6),
                              ConstrainedBox(
                                  constraints:  BoxConstraints(
                                    maxHeight: 1000,
                                    maxWidth: screnWidth*.92,
                                  ),
                                  child: Container(
                                    child: _infoDoPrestadorDeServico(context, Icons.account_box, this.prestador.roles.toString()),
                                  )
                              ),
                              SizedBox(height: 6),
                              _infoDoPrestadorDeServico(context, Icons.description, 'DESCRIÇÃO'),
                              SizedBox(height: 6),
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
                              child: Text(this.prestador.description),
                          )
                      ),
                      _botoes(context,this.prestador.IdPrestador),
                      SizedBox(height: 15,),

                      ViewBotaoAlterarSatatus(idPrestador: prestador.IdPrestador,),
                      SizedBox(height: 20,),

                    ],
                  ),
                ),
              ],
            ),

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


  Widget _infoDoPrestadorDeServicoCidadeServico(
      BuildContext context, IconData iconData, String texto) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.60,
      child: Row(
        children: [
          Icon(iconData),
          SizedBox(
            width: 8,
          ),
          Expanded(child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                texto,
                textAlign: TextAlign.justify,
                style: Theme.of(context).textTheme.caption,
              ),
            ],
          )),
        ],
      ),
    );
  }



  Widget _botoes(BuildContext context, String idPrestador) {
    return Padding(
      padding: const EdgeInsets.only(top: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            children: [
              Container(
                height: 130,
                width: 130,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image:  NetworkImage(this.prestador.profilePicture),
                        fit: BoxFit.fill)),

              ),
              SizedBox(
                width: 130,
                child: ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Color(0xff9e9e9e)),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50.0),
                          ))),
                  onPressed: () async {
                    await saveProfilePicture(profilePicture: prestador.profilePicture, name: prestador.name);

                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Icon(Icons.arrow_downward, color: Colors.white),
                      Text("Foto", style: TextStyle(color: Colors.white)),
                    ],
                  ),
                ),
              ),
            ],
          ),
          SizedBox(width: 30,),
          Column(
            children: [
              Container(
                height: 130,
                width: 130,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image:  NetworkImage(this.prestador.brazilianIDPicture),
                        fit: BoxFit.cover)),

              ),
              SizedBox(
                // Colors.greenAccent
                width: 130,
                child: ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Color(0xff9e9e9e)),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50.0),
                          ))),
                  onPressed: () async {
                    await saveBrazilianIdPicture(brazilianIdPicture: prestador.brazilianIDPicture);

                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Icon(Icons.arrow_downward, color: Colors.white),
                      Text("Identidade", style: TextStyle(color: Colors.white)),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  saveProfilePicture({required String profilePicture, required String name}) async{
    String url = profilePicture;
    String fileName = name;
    openFile(url: url, fileName: fileName);
  }

  Future openFile({required String url, required String fileName}) async{
    await dowloadFile(url: url, fileName: fileName);
  }


  Future dowloadFile({required String url, required String fileName}) async{
    var directory = await getApplicationDocumentsDirectory();
    var file = File('${directory.path}/${fileName}');

    final response = await Dio().get(
      url,
      options: Options(
        responseType: ResponseType.bytes,
        followRedirects: false,
        receiveTimeout: 0,
      )
    );

    final raf = file.openSync(mode: FileMode.write);
    raf.writeFromSync(response.data);
    await raf.close();
    return file;
  }

  saveBrazilianIdPicture({required String brazilianIdPicture}) async{
    await GallerySaver.saveImage(brazilianIdPicture);
  }


  Future whatsAppNaoIntalado(context) => showDialog(
    context: context,
    builder: (context) => PopUpWhatsAppNaoEstaIntalado(),
  );
}
