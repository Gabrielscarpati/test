import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

import 'package:projeto_treinamento/businessModels/businessModelUsuario.dart';

import '../viewActionsHub.dart';
import '../viewModelHub.dart';

class ViewHubCidade extends StatelessWidget {
  ViewHubCidade({
    Key? key,
    required this.viewModel,
    required this.viewActions,
  });

  final ViewModelHubUsuario viewModel;
  final ViewActionsHubUsuario viewActions;

  @override
  Widget build(BuildContext context) {
    /*if (viewModel.cidade.codCidade == 0) {
      return SizedBox.shrink();
    }*/

    return Padding(
      padding: const EdgeInsets.only(top: 12, left: 16, right: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Selecione a sua cidade:",
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 20)),
          //Theme.of(context).textTheme.TextStyle.hubText,

          ElevatedButton(
            style: ElevatedButton.styleFrom(
                shadowColor: Colors.black,
                primary: Colors
                    .white, //[Colors.blue.shade900,Colors.blue.shade500,  Colors.blue.shade400]
                shape: new RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(20.0),
                )),
            onPressed: () {
              this.viewActions.abreTelaDePesquisaDeCidade(context, viewModel);
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Text(viewModel.cidade.nome,
                      style: TextStyle(
                          color: Colors.blue.shade800,
                          fontWeight: FontWeight.bold,
                          fontSize: 16)),
                ),
                Icon(
                  Icons.search,
                  size: 32,
                  color: Colors.blue.shade800,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
