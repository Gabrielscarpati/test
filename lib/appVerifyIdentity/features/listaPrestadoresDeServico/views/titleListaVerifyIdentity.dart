import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../viewModelListaVerifyIdentity.dart';

class TitleListaVerifyIdentity extends StatelessWidget {
  final ViewModelListaVerifyIdentity viewModel;

  const TitleListaVerifyIdentity({
    Key? key,
    required this.viewModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Text(
          'Prestadores Pendentes',
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
