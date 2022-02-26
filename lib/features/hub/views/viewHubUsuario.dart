import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:projeto_treinamento/businessModels/businessModelUsuario.dart';

import '../viewActionsHub.dart';
import '../viewModelHub.dart';

class ViewHubUsuario extends StatelessWidget {
  ViewHubUsuario({
    Key? key,
    required this.viewModel,
    required this.viewActions,
  });

  final ViewModelHub viewModel;
  final ViewActionsHub viewActions;

  @override
  Widget build(BuildContext context) {
    BusinessModelUsuario usuario = viewModel.usuario;
    return Padding(
      padding: const EdgeInsets.only(top: 32, left: 32, right: 32),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Olá,",
                style: Theme.of(context).textTheme.headline4!.copyWith(fontSize: Theme.of(context).textTheme.headline5!.fontSize),
              ),
              Text(
                usuario.primeiroNome(),
                style: Theme.of(context).textTheme.headline4!.copyWith(fontWeight: FontWeight.bold),
              ),
            ],
          ),
          InkWell(
            onTap: () {
              viewActions.AbreTelaInfoUsuario(context, viewModel);
            },
            child: Hero(
              tag: viewModel.usuario.id,
              child: CircleAvatar(
                backgroundColor: Colors.white,
                foregroundColor: Colors.black,
                backgroundImage: NetworkImage(usuario.urlFoto!),
                radius: 30.0,
                child: Text("", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0)),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
