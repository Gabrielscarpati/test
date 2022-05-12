import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../businessModels/businessModelTiposDeServico.dart';
import '../viewActionsHub.dart';
import '../viewModelHub.dart';

class ViewHubGridView extends StatelessWidget {
  ViewHubGridView({
    Key? key,
    required this.viewModel,
    required this.viewActions,
  });

  final ViewModelHub viewModel;
  final ViewActionsHub viewActions;

  @override
  Widget build(BuildContext context) {
    return  Column(

      children: [
        Text(
            "Selecione o serviço desejado:",
            style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 20)
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
      ],
    );
  }

  Widget _buildBotaoServico(BuildContext context, int index) {
    BusinessModelTiposDeServico tiposDeServico = viewModel.principaisTiposDeServicoCidade.tiposDeServico[index];
    return Padding(

      padding: const EdgeInsets.fromLTRB(12, 12, 12, 12),
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
            Icon(tiposDeServico.icone, size: 80, ),
            //Image.asset("assets/image_2.png"),

            Text(tiposDeServico.descricao),
          ],
        ),
      ),
    );
  }
}
