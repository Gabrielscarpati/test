import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:projeto_treinamento/businessModels/businessModelCidade.dart';
import 'package:projeto_treinamento/businessModels/businessModelPrincipaisTiposDeServicoCidade.dart';
import 'package:projeto_treinamento/businessModels/businessModelUsuario.dart';
import 'package:projeto_treinamento/features/hub/viewModelHub.dart';
import 'package:projeto_treinamento/features/infoUsuario/presenterInfoUsuario.dart';
import 'package:projeto_treinamento/features/infoUsuario/viewModelInfoUsuario.dart';
import 'package:projeto_treinamento/features/listaPrestadoresDeServico/presenterListaPrestadoresDeServico.dart';
import 'package:projeto_treinamento/features/pesquisaCidade/presenterPesquisaCidade.dart';
import 'package:projeto_treinamento/features/pesquisaTipoServico/presenterPesquisaTipoServico.dart';
import 'package:projeto_treinamento/framework/pipe.dart';
import 'package:projeto_treinamento/framework/viewActions.dart';
import 'package:projeto_treinamento/providers/cidade/providerCidade.dart';

import 'blocEventHub.dart';

class ViewActionsHub extends ViewActions<BlocEventHub> {
  ViewActionsHub(Pipe<BlocEventHub> blocPipeIn) : super(blocPipeIn);

  void abreTelaMostraPrestadoresDeServico(BuildContext context, ViewModelHub viewModel, int codTipoDeServico) {
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

  void abreTelaDePesquisaDeCidade(BuildContext context, ViewModelHub viewModel) {
    Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) => PresenterPesquisaCidade.presenter(codTipoDeServico: 0))).then((codCidade) {
      if (codCidade != null) {
        BlocEventHubSelecionaCidade blocEvent = BlocEventHubSelecionaCidade(viewModel: viewModel, codCidade: codCidade);
        blocPipeIn.send(blocEvent);
      }
    });
  }

  void abreTelaDePesquisaDeTipoDeServico(BuildContext context, ViewModelHub viewModel) {
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

  void AbreTelaInfoUsuario(BuildContext context, ViewModelHub viewModel) async {
    ViewModelInfoUsuario _viewModel =
        ViewModelInfoUsuario(
            cidade: viewModel.cidade,
            usuario: viewModel.usuario,
            listaCompletaCidade: ProviderCidade().getBusinessModels(),
        );

    final ViewModelInfoUsuario results = await Navigator.of(context).push(MaterialPageRoute(
        builder: (BuildContext context) => PresenterInfoUsuario.presenter(
              viewModel: _viewModel,
            )));

    if (results != null) {
      ViewModelHub novoViewModel =
          ViewModelHub(
              cidade: results.cidade,
              usuario: results.usuario,
              principaisTiposDeServicoCidade: BusinessModelPrincipaisTiposDeServicoCidade.vazio(),
              email: viewModel.email,
              phone: viewModel.phone,
              workingHours: viewModel.workingHours,
              brazilianID: viewModel.brazilianID,
              roles: viewModel.roles,
              description: viewModel.description,
              brazilianIDpicture: viewModel.brazilianIDpicture,
          );
      AtualizaTelaHub(novoViewModel);
    }
  }

  void AtualizaTelaHub(ViewModelHub viewModel) {
    BlocEventHubAtualizaViewModel blocEvent = BlocEventHubAtualizaViewModel(viewModel: viewModel);
    blocPipeIn.send(blocEvent);
  }
}
