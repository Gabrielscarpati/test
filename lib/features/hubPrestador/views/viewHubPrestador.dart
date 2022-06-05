import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:projeto_treinamento/businessModels/businessModelUsuario.dart';

import '../../../businessModels/businessModelDadosPrestador.dart';
import '../../perfilPrestadorDeServico/viewModelPerfilPrestadorDeServico.dart';
import '../viewActionsHub.dart';
import '../viewModelHub.dart';

class ViewHubPrestador extends StatelessWidget {
  ViewHubPrestador({
    Key? key,
    required this.viewModel,
    required this.viewActions,
  });

  final ViewModelHubPrestador viewModel;
  final ViewActionsHubPrestador viewActions;

  @override
  Widget build(BuildContext context) {
    BusinessModelDadosPrestador usuario = viewModel.prestador;
    return Padding(
      padding: const EdgeInsets.only(top: 44, left: 32, right: 32, bottom: 24),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Olá,",
                  style: TextStyle(
                      color: Colors.grey[600],
                      fontWeight: FontWeight.bold,
                      fontSize: 24)),
              Text(usuario.primeiroNome(),
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 36)),
            ],
          ),
          InkWell(
            onTap: () {
              viewActions.AbreTelaInfoPrestador(context, viewModel);
            },
            child: Hero(
              tag: viewModel.prestador.id,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                        blurRadius: 10, color: Colors.black, spreadRadius: 1)
                  ],
                ),
                child: CircleAvatar(
                  backgroundColor: Colors.white,
                  foregroundColor: Colors.black,
                  backgroundImage:
                      NetworkImage(viewModel.prestador.profilePicture),
                  radius: 36.0,
                  child: Text("",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 20.0)),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
