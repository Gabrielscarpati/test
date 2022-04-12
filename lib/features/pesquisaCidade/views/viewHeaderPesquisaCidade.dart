import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:projeto_treinamento/features/hub/views/viewHubUsuario.dart';
import 'package:projeto_treinamento/features/pesquisaCidade/viewModelPesquisaCidade.dart';
import 'package:projeto_treinamento/features/pesquisaCidade/viewPesquisaCidade.dart';

import '../viewActionsPesquisaCidade.dart';

class ViewHeaderPesquisaCidade extends StatelessWidget {
  ViewHeaderPesquisaCidade({
    Key? key,
    required this.viewModel,
    required this.viewActions,
  });

  final ViewModelPesquisaCidade viewModel;
  final ViewActionsPesquisaCidade viewActions;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          controller: viewModel.controlerFieldPesquisa,
          onChanged: (text) {
            this.viewActions.aplicaFiltroPesquisa(this.viewModel);
          },
          decoration: new InputDecoration(
            filled: true,

            fillColor: Colors.white,
            prefixIcon: new Icon(Icons.search,
              color: Colors.blue.shade800,
            ),
            labelText: "Pesquisa prestador de serviço",
              labelStyle: TextStyle(
                color: Colors.blue.shade800,
              ),
            enabledBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(8.0)),
              borderSide: const BorderSide(
                color: Colors.blueAccent,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(8.0)),
              borderSide: BorderSide(color: Colors.blue),
            ),
          ),
        )
      ],
    );
  }
}
