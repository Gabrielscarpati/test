import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../viewActionsSelectCidade.dart';
import '../viewModelSelectCidade.dart';

class ViewHeaderSelectCidadea extends StatelessWidget {
  ViewHeaderSelectCidadea({
    Key? key,
    required this.viewModel,
    required this.viewActions,
  });

  final ViewModelSelectCidade viewModel;
  final ViewActionsSelectCidade viewActions;

  @override
  Widget build(BuildContext context) {

    return Column(
      children: [
        TextField(
          controller: viewModel.controlerFieldPesquisa,
          onChanged: (value) {
            this.viewActions.aplicaFiltroPesquisa(this.viewModel);
          },
          decoration: new InputDecoration(
            filled: true,

            fillColor: Colors.white,
            prefixIcon: new Icon(Icons.search,
              color: Colors.blue.shade800,
            ),
            labelText: "Pesquisa pela cidade",
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
