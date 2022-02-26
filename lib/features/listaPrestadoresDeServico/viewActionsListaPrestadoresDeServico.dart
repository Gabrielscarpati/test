import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:projeto_treinamento/businessModels/businessModelPrestadorDeServicos.dart';
import 'package:projeto_treinamento/features/infoPrestadorDeServico/presenterInfoPrestadorDeServico.dart';
import 'package:projeto_treinamento/features/listaPrestadoresDeServico/viewModelListaPrestadoresDeServico.dart';
import 'package:projeto_treinamento/framework/pipe.dart';
import 'package:projeto_treinamento/framework/viewActions.dart';
import 'package:projeto_treinamento/framework/viewModel.dart';

import 'blocEventListaPrestadoresDeServico.dart';

class ViewActionsListaPrestadoresDeServico extends ViewActions<BlocEventListaPrestadoresDeServico> {
  ViewActionsListaPrestadoresDeServico(Pipe<BlocEventListaPrestadoresDeServico> blocPipeIn) : super(blocPipeIn);

  void aplicaFiltroPesquisa(ViewModelListaPrestadoresDeServico viewModel) {
    BlocEventListaPrestadoresDeServicoAplicaFiltroDePesquisa blocEvent = BlocEventListaPrestadoresDeServicoAplicaFiltroDePesquisa(viewModel);
    blocPipeIn.send(blocEvent);
  }

  void refreshDadosDaTela(ViewModelListaPrestadoresDeServico viewModel) {
    BlocEventListaPrestadoresDeServicoInicializaViewModel blocEvent = BlocEventListaPrestadoresDeServicoInicializaViewModel(
      codCidade: viewModel.cidade.codCidade,
      codTipoDeServico: viewModel.tiposDeServico.codTipoServico,
    );
    blocPipeIn.send(blocEvent);
  }

  void abreTelaInfoPrestadorDeServico(
      BuildContext context, ViewModelListaPrestadoresDeServico viewModel, BusinessModelPrestadorDeServicos prestadorDeServicos) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (BuildContext context) => PresenterInfoPrestadorDeServico.presenter(prestadorDeServicos, viewModel.cidade, viewModel.tiposDeServico),
      ),
    );
  }
}
