import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:projeto_treinamento/businessModels/businessModelCidade.dart';
import 'package:projeto_treinamento/businessModels/businessModelPrincipaisTiposDeServicoCidade.dart';
import 'package:projeto_treinamento/businessModels/businessModelUsuario.dart';
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

  void abreTelaMostraPrestadoresDeServico(BuildContext context,
      ViewModelHubPrestador viewModel, int codTipoDeServico) {
    Navigator.of(context)
        .push(
      MaterialPageRoute(
        builder: (BuildContext context) =>
            PresenterListaPrestadoresDeServico.presenter(
                codTipoDeServico: codTipoDeServico,
                codCidade: viewModel.cidade.codCidade),
      ),
    )
        .then((codTipoDeServico) {
      // ??
    });
  }

  void abreTelaDePesquisaDeCidade(
      BuildContext context, ViewModelHubPrestador viewModel) {
    Navigator.of(context)
        .push(MaterialPageRoute(
            builder: (BuildContext context) =>
                PresenterPesquisaCidade.presenter(codTipoDeServico: 0)))
        .then((codCidade) async {
      if (codCidade != null) {
        int newcodCidade = await GetCodCidade(nomeCidade: codCidade).action();
        BlocEventHubSelecionaCidade blocEvent = BlocEventHubSelecionaCidade(
            viewModel: viewModel, codCidade: newcodCidade);
        blocPipeIn.send(blocEvent);
      }
    });
  }

  void abreTelaDePesquisaDeTipoDeServico(
      BuildContext context, ViewModelHubPrestador viewModel) {
    Navigator.of(context)
        .push(
      MaterialPageRoute(
        builder: (BuildContext context) =>
            PresenterPesquisaTipoServico.presenter(
                principaisTiposDeServicoCidade:
                    viewModel.principaisTiposDeServicoCidade),
      ),
    )
        .then((codTipoDeServico) {
      if (codTipoDeServico != null)
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (BuildContext context) =>
                PresenterListaPrestadoresDeServico.presenter(
                    codTipoDeServico: codTipoDeServico,
                    codCidade: viewModel.cidade.codCidade),
          ),
        );
    });
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
    final ViewModelHubPrestador results = await Navigator.of(context).push(
        MaterialPageRoute(
            builder: (BuildContext context) =>
                PresenterInfoDadosPrestador.presenter(
                  viewModel: _viewModelInfoPrestador,
                )));

    if (results != null) {
      ViewModelHubPrestador novoViewModel = ViewModelHubPrestador(
        prestador: results.prestador,
        cidade: results.cidade,
        principaisTiposDeServicoCidade:
            BusinessModelPrincipaisTiposDeServicoCidade.vazio(),
      );
      AtualizaTelaHub(novoViewModel);
    }
  }

  void AtualizaTelaHub(ViewModelHubPrestador viewModel) {
    BlocEventHubPrestadorAtualizaViewModel blocEvent =
        BlocEventHubPrestadorAtualizaViewModel(viewModel: viewModel);
    blocPipeIn.send(blocEvent);
  }
}
