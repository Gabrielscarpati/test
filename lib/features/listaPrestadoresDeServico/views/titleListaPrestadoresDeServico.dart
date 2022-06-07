import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../viewModelListaPrestadoresDeServico.dart';

class TitleListaDePrestadoresDeServico extends StatelessWidget {
  final ViewModelListaPrestadoresDeServico viewModel;

  const TitleListaDePrestadoresDeServico({
    Key? key,
    required this.viewModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Icon(viewModel.tiposDeServico.icone),
        Text(
          viewModel.tiposDeServico.descricao,
          style: TextStyle(color: Colors.white),
        ),
        Text(
          "(" + viewModel.listaVisivel.length.toString() + ")",
          style: TextStyle(color: Colors.white),
        ),
      ],
    );
  }
}
