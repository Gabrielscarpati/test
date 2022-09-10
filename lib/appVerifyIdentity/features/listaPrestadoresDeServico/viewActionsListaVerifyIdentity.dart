import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:projeto_treinamento/appVerifyIdentity/features/listaPrestadoresDeServico/viewModelListaVerifyIdentity.dart';
import 'package:projeto_treinamento/framework/pipe.dart';
import 'package:projeto_treinamento/framework/viewActions.dart';
import '../../businessModel/businessModelVerifyIdentity.dart';
import '../infoPrestadorDeServico/viewInfoVerifyIdetity.dart';
import 'blocEventListaVerifyIdentity.dart';

class ViewActionsListaVerifyIdentity extends ViewActions<BlocEventListaVerifyIdentity> {
  ViewActionsListaVerifyIdentity(Pipe<BlocEventListaVerifyIdentity> blocPipeIn) : super(blocPipeIn);

  void aplicaFiltroPesquisa(ViewModelListaVerifyIdentity viewModel) {
    BlocEventListaVerifyIdentityAplicaFiltroDePesquisa blocEvent = BlocEventListaVerifyIdentityAplicaFiltroDePesquisa(viewModel);
    blocPipeIn.send(blocEvent);
  }

  void abreTelaInfoVerifyIdentityo(
      BuildContext context, ViewModelListaVerifyIdentity viewModel, BusinessModelVerifyIdentity prestadorDeServicos) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (BuildContext context) => ViewInfoVerifyIdentity(prestador: prestadorDeServicos,) //PresenterInfoVerifyIdentity.presenter(prestadorDeServicos),
      ),
    );
  }
}


