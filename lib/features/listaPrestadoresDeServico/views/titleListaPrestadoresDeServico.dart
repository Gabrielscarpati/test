import 'package:flutter/cupertino.dart';

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
        Text(viewModel.tiposDeServico.descricao),
        Text("(" + viewModel.listaVisivel.length.toString() + ")"),
      ],
    );
  }
}
