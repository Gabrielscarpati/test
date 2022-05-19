import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:projeto_treinamento/features/logIn_SingUp/pesquisaCidade/views/viewHeaderPesquisaCidade.dart';
import 'package:projeto_treinamento/features/pesquisaCidade/viewModelPesquisaCidade.dart';
import 'package:projeto_treinamento/features/pesquisaCidade/views/listItemPesquisaCidades.dart';
import '../../../hub/presenterHub.dart';
import 'listItemPesquisaCidades.dart';

class ViewListaCidadesa extends StatefulWidget {
  ViewListaCidadesa({
    Key? key,});


  @override
  State<ViewListaCidadesa> createState() => _ViewListaCidadesaState();
}



class _ViewListaCidadesaState extends State<ViewListaCidadesa> {

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.only(top: 4, left: 4, right: 4),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Selecione as cidades que voce pretende trabalhar",
                        style: Theme.of(context).textTheme.headline3!.copyWith(fontSize: Theme.of(context).textTheme.bodyText2!.fontSize),
                      ),
                      Text(
                        "Cidades selecionadas: ${1} ",
                        textAlign: TextAlign.start,
                        style: Theme.of(context).textTheme.headline3!.copyWith(fontSize: Theme.of(context).textTheme.bodyText2!.fontSize),
                      ),
                    ],
                  ),
                ),
              ),
              ListView.builder(
                  shrinkWrap: true,
                  itemCount: 12,//visibleCountries.length,
                  itemBuilder: (context,index) {
                    return Card(
                      color: Colors.white,

                      child: ListTile(
                          onTap:(){
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => PresenterHub.presenter()
                            ));
                          },
                          title: Text('getVisibleCountries()[index]',

                            style: TextStyle(
                                color: Colors.black
                            ),
                          ),
                          leading: Icon(Icons.location_city)
                      ),
                    );
                  }),
              ],
            ),
          ),
        ),
      );
    }
}
