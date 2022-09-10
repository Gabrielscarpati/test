import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:projeto_treinamento/util/libraryComponents/colors/colors.dart';

import '../viewActionsSelectServicos.dart';
import '../viewModelSelectServicos.dart';

class ViewHeaderSelectServicos extends StatelessWidget {
  ViewHeaderSelectServicos({
    Key? key,
    required this.viewModel,
    required this.viewActions,
  });

  final ViewModelSelectServicos viewModel;
  final ViewActionsSelectServicos viewActions;

  @override
  Widget build(BuildContext context) {

    return Column(
      children: [
        TextField(
          cursorColor: CursorColor,
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
            labelText: "Pesquise por serviço",
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
