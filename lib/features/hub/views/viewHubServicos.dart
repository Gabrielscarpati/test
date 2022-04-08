import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:projeto_treinamento/businessModels/businessModelTiposDeServico.dart';

import 'buildBotaoService.dart';
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
          Text(
              "Selecione o tipo de serviço desejado:",
              style: TextStyle(
                  color: Colors.grey[600],
                  fontWeight: FontWeight.bold,
                  fontSize: 16)
          ),
          GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 0,
              crossAxisSpacing: 0,
            ),
            shrinkWrap: true,
            itemCount: 4,
            itemBuilder: _buildBotaoServico,
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
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
                          child: Text('Procurar',
                              style: TextStyle(
                                  color: Colors.blue[800],
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16)
                          ),
                        ),
                        Icon(Icons.search,
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
    );
  }


Widget _buildBotaoServico(BuildContext context, int index) {
  BusinessModelTiposDeServico tiposDeServico = viewModel.principaisTiposDeServicoCidade.tiposDeServico[index];
  return Padding(
    padding: const EdgeInsets.all(12.0),
    child: ElevatedButton(
      style: ElevatedButton.styleFrom(
          shadowColor: Colors.black,
          primary: Colors.white, //[Colors.blue.shade900,Colors.blue.shade500,  Colors.blue.shade400]
          shape: new RoundedRectangleBorder(
            borderRadius: new BorderRadius.circular(20.0),
          )
      ),
      onPressed: () {
        viewActions.abreTelaMostraPrestadoresDeServico(context, viewModel, tiposDeServico.codTipoServico);
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Icon(tiposDeServico.icone,size: 80, ),
          //Image.asset("assets/image_2.png"),

          Text(tiposDeServico.descricao),
        ],
      ),
    ),
  );
}
}