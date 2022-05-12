import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:projeto_treinamento/businessModels/businessModelTiposDeServico.dart';
import '../viewActionsHub.dart';
import '../viewModelHub.dart';

class ViewHubServicos extends StatelessWidget {
  ViewHubServicos({
    Key? key,
    required this.viewModel,
    required this.viewActions,
  });

  final ViewModelHub viewModel;
  final ViewActionsHub viewActions;

  @override
  Widget build(BuildContext context) {
    if (viewModel.principaisTiposDeServicoCidade.tiposDeServico.length == 0) {
      return CircularProgressIndicator();
    }
    return Padding(
      padding: const EdgeInsets.only(top: 0, left: 12, right: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

           Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                      "Nao encontrou?",
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 20)
                  ),



                  Center(
                    child: Row(
                      children: [
                        Expanded(
                          child: ElevatedButton(

                            style: ElevatedButton.styleFrom(
                                shadowColor: Colors.black,
                                primary: Colors.white, //[Colors.blue.shade900,Colors.blue.shade500,  Colors.blue.shade400]
                                shape: new RoundedRectangleBorder(
                                  borderRadius: new BorderRadius.circular(20.0),
                                )
                            ),

                            onPressed: () {
                              viewActions.abreTelaDePesquisaDeTipoDeServico(
                                  context, viewModel);
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(12.0),
                                  child: Text('Procure aqui',
                                      style: TextStyle(
                                          color: Colors.blue[800],
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16)
                                  ),
                                ),
                                Icon( Icons.search,
                                  size: 32,
                                color: Colors.blue.shade800,),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

        ],
      ),
    );
  }



}