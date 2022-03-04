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
      padding: const EdgeInsets.only(top: 32, left: 32, right: 32),
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
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      viewActions.abreTelaDePesquisaDeTipoDeServico(context, viewModel);
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Procurar",
                             style: TextStyle(
                                  color: Colors.grey[600],
                                  //fontWeight: FontWeight.bold,
                                  fontSize: 15)
                                ),

                        Icon(Icons.search),
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
      padding: const EdgeInsets.all(8.0),
      child: ElevatedButton(
        onPressed: () {
          viewActions.abreTelaMostraPrestadoresDeServico(context, viewModel, tiposDeServico.codTipoServico);
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Icon(tiposDeServico.icone),
            Text(tiposDeServico.descricao),
          ],
        ),
      ),
    );
  }
}
