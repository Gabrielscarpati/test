import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:projeto_treinamento/businessModels/businessModelCidade.dart';
import 'package:projeto_treinamento/businessModels/businessModelPrincipaisTiposDeServicoCidade.dart';
import 'package:projeto_treinamento/businessModels/businessModelUsuario.dart';
import 'package:projeto_treinamento/features/hubPrestador/viewModelHub.dart';
import 'package:projeto_treinamento/features/infoPrestadorDeServico/presenterInfoPrestadorDeServico.dart';
import 'package:projeto_treinamento/features/infoPrestadorDeServico/viewModelInfoPrestadorDeServico.dart';
import 'package:projeto_treinamento/features/listaPrestadoresDeServico/presenterListaPrestadoresDeServico.dart';
import 'package:projeto_treinamento/features/perfilPrestadorDeServico/viewModelPerfilPrestadorDeServico.dart';
import 'package:projeto_treinamento/features/pesquisaCidade/presenterPesquisaCidade.dart';
import 'package:projeto_treinamento/features/pesquisaTipoServico/presenterPesquisaTipoServico.dart';
import 'package:projeto_treinamento/framework/pipe.dart';
import 'package:projeto_treinamento/framework/viewActions.dart';
import 'package:projeto_treinamento/providers/cidade/providerCidade.dart';

import '../../businessModels/businessModelPrestadorInfomation.dart';
import '../perfilPrestadorDeServico/presenterPerfilPrestadorDeServico.dart';
import 'blocEventHub.dart';

class ViewActionsHubPrestador extends ViewActions<BlocEventHubPrestador> {
  ViewActionsHubPrestador(Pipe<BlocEventHubPrestador> blocPipeIn) : super(blocPipeIn);

  void abreTelaMostraPrestadoresDeServico(BuildContext context, ViewModelHubPrestador viewModel, int codTipoDeServico) {
    Navigator.of(context)
        .push(
      MaterialPageRoute(
        builder: (BuildContext context) =>
            PresenterListaPrestadoresDeServico.presenter(codTipoDeServico: codTipoDeServico, codCidade: viewModel.cidade.codCidade),
      ),
    )
        .then((codTipoDeServico) {
      // ??
    });
  }

  void abreTelaDePesquisaDeCidade(BuildContext context, ViewModelHubPrestador viewModel) {
    Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) => PresenterPesquisaCidade.presenter(codTipoDeServico: 0))).then((codCidade) {
      if (codCidade != null) {
        BlocEventHubSelecionaCidade blocEvent = BlocEventHubSelecionaCidade(viewModel: viewModel, codCidade: codCidade);
        blocPipeIn.send(blocEvent);
      }
    });
  }

  void abreTelaDePesquisaDeTipoDeServico(BuildContext context, ViewModelHubPrestador viewModel) {
    Navigator.of(context)
        .push(
      MaterialPageRoute(
        builder: (BuildContext context) => PresenterPesquisaTipoServico.presenter(principaisTiposDeServicoCidade: viewModel.principaisTiposDeServicoCidade),
      ),
    )
        .then((codTipoDeServico) {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (BuildContext context) =>
              PresenterListaPrestadoresDeServico.presenter(codTipoDeServico: codTipoDeServico, codCidade: viewModel.cidade.codCidade),
        ),
      );
    });
  }

  void AbreTelaInfoUsuario(BuildContext context, ViewModelHubPrestador viewModel) async {
    ViewModelPerfilPrestadorDeServico _viewModel = ViewModelPerfilPrestadorDeServico(prestadorInformation: BusinessModelPrestadorInformation);


    final ViewModelHubPrestador results = await Navigator.of(context).push(MaterialPageRoute(
        builder: (BuildContext context) =>PresenterPerfilPrestadorDeServico.presenter()));

    if (results != null) {
      ViewModelHubPrestador novoViewModel =
          ViewModelHubPrestador(
              prestador: prestador,
              cidade: results.cidade,
              principaisTiposDeServicoCidade: BusinessModelPrincipaisTiposDeServicoCidade.vazio(),
          );
      AtualizaTelaHub(novoViewModel);
    }
  }

  void AtualizaTelaHub(ViewModelHubPrestador viewModel) {
    BlocEventHubPrestadorAtualizaViewModel blocEvent = BlocEventHubPrestadorAtualizaViewModel(viewModel: viewModel);
    blocPipeIn.send(blocEvent);
  }
}
