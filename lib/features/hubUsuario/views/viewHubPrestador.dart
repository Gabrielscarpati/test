import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:projeto_treinamento/businessModels/businessModelUsuario.dart';

import '../viewActionsHub.dart';
import '../viewModelHub.dart';

class ViewHubUsuarioHeader extends StatelessWidget {
  ViewHubUsuarioHeader({
    Key? key,
    required this.viewModel,
    required this.viewActions,
  });

  final ViewModelHubUsuario viewModel;
  final ViewActionsHubUsuario viewActions;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 44, left: 32, right: 32, bottom: 24),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [],
      ),
    );
  }
}
