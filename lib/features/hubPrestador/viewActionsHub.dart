import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:projeto_treinamento/businessModels/businessModelCidade.dart';
import 'package:projeto_treinamento/businessModels/businessModelDadosPrestador.dart';
import 'package:projeto_treinamento/businessModels/businessModelPrincipaisTiposDeServicoCidade.dart';
import 'package:projeto_treinamento/businessModels/businessModelUsuario.dart';
import 'package:projeto_treinamento/daos/firebase/updatePrestadorFirebase.dart';
import 'package:projeto_treinamento/features/hubPrestador/viewModelHub.dart';
import 'package:projeto_treinamento/features/infoDadosPrestador/presenterInfoDadosPrestador.dart';
import 'package:projeto_treinamento/features/infoPrestadorDeServico/presenterInfoPrestadorDeServico.dart';
import 'package:projeto_treinamento/features/infoPrestadorDeServico/viewModelInfoPrestadorDeServico.dart';
import 'package:projeto_treinamento/features/listaPrestadoresDeServico/presenterListaPrestadoresDeServico.dart';
import 'package:projeto_treinamento/features/perfilPrestadorDeServico/viewModelPerfilPrestadorDeServico.dart';
import 'package:projeto_treinamento/features/pesquisaTipoServico/presenterPesquisaTipoServico.dart';
import 'package:projeto_treinamento/framework/pipe.dart';
import 'package:projeto_treinamento/framework/viewActions.dart';
import 'package:projeto_treinamento/providers/cidade/providerCidade.dart';

import '../../businessModels/businessModelPrestadorInfomation.dart';
import '../../util/getCodigoCidade.dart';
import '../infoDadosPrestador/viewModelInfoDadosPrestador.dart';
import '../perfilPrestadorDeServico/presenterPerfilPrestadorDeServico.dart';
import '../pesquisaCidade/presenterPesquisaCidade.dart';
import 'blocEventHub.dart';

class ViewActionsHubPrestador extends ViewActions<BlocEventHubPrestador> {
  ViewActionsHubPrestador(Pipe<BlocEventHubPrestador> blocPipeIn)
      : super(blocPipeIn);

  void AtualizaTelaHub(ViewModelHubPrestador viewModel) {
    BlocEventHubPrestadorAtualizaViewModel blocEvent =
        BlocEventHubPrestadorAtualizaViewModel(viewModel: viewModel);
    blocPipeIn.send(blocEvent);
  }

  void AbreTelaInfoPrestador(
      BuildContext context, ViewModelHubPrestador viewModel) async {
    List<BusinessModelCidade> cidades =
    await ProviderCidade().getBusinessModels();
    ViewModelInfoDadosPrestador _viewModelInfoPrestador =
    ViewModelInfoDadosPrestador(
      cidades: cidades,
      listaCompletaCidade: cidades,
      prestador: viewModel.prestador,
    );
    final BusinessModelDadosPrestador results = await Navigator.of(context)
        .push(MaterialPageRoute(
        builder: (BuildContext context) =>
            PresenterInfoDadosPrestador.presenter(
              viewModel: _viewModelInfoPrestador,
            )));

    if (results != null) {
      ViewModelHubPrestador novoViewModel = ViewModelHubPrestador(
        prestador: results,
        cidade: viewModel.cidade,
        listaAvaliacoesPrestadorDeServico: [],
        prestadorDeServicos: viewModel.prestadorDeServicos,
        tiposDeServico: viewModel.tiposDeServico,
      );
      UpdateDadosPrestador(prestador: novoViewModel.prestador)
          .updateDadosPrestador();
      AtualizaTelaHub(novoViewModel);
    }
  }




}
