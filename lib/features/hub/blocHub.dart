import 'package:flutter/cupertino.dart';
import 'package:projeto_treinamento/businessModels/businessModelCidade.dart';
import 'package:projeto_treinamento/businessModels/businessModelPrincipaisTiposDeServicoCidade.dart';
import 'package:projeto_treinamento/businessModels/businessModelUsuario.dart';
import 'package:projeto_treinamento/framework/bloc.dart';
import 'package:projeto_treinamento/providers/principaisTiposDeServicoCidade/providerPrincipaisTiposDeServicoCidade.dart';

import 'blocEventHub.dart';
import 'viewModelHub.dart';

class BlocHub extends Bloc<ViewModelHub, BlocEventHub> {
  @override
  void onReceiveBlocEvent(BlocEventHub blocEvent) {
    if (blocEvent is BlocEventHubInicializaViewModel) _inicializaViewModel(blocEvent);
    if (blocEvent is BlocEventHubSelecionaCidade) _selecionaCidade(blocEvent);
    if (blocEvent is BlocEventHubAtualizaViewModel) _atualizaViewModel(blocEvent);
  }

  void _inicializaViewModel(BlocEventHubInicializaViewModel blocEvent) async {
    BusinessModelUsuario usuario = BusinessModelUsuario(
      email: "tiago@teste.com.br",
      nome: "Tiago da Silva",
      urlFoto: 'https://www.planetware.com/wpimages/2020/02/france-in-pictures-beautiful-places-to-photograph-eiffel-tower.jpg',
    );
    String idCidadeDoUsuario = "1"; // 1=colatina

    ViewModelHub viewModelTmp = ViewModelHub(
      usuario: usuario,
      cidade: BusinessModelCidade.vazio(),
      principaisTiposDeServicoCidade: BusinessModelPrincipaisTiposDeServicoCidade.vazio(),
    );
    this.sendViewModelOut(viewModelTmp);

    ViewModelHub viewModel = await _aplicaCidadeNoViewModel(usuario, idCidadeDoUsuario);
    this.sendViewModelOut(viewModel);
  }

  void _selecionaCidade(BlocEventHubSelecionaCidade blocEvent) async {
    ViewModelHub viewModel = await _aplicaCidadeNoViewModel(
      blocEvent.viewModel.usuario,
      blocEvent.codCidade.toString(),
    );
    this.sendViewModelOut(viewModel);
  }

  Future<ViewModelHub> _aplicaCidadeNoViewModel(BusinessModelUsuario usuario, String idCidade) async {
    BusinessModelPrincipaisTiposDeServicoCidade principaisTiposDeServicoCidade = await ProviderPrincipaisTiposDeServicoCidade().getBusinessModel(idCidade);
    ViewModelHub viewModel = ViewModelHub(
      usuario: usuario,
      cidade: principaisTiposDeServicoCidade.cidade,
      principaisTiposDeServicoCidade: principaisTiposDeServicoCidade,
    );
    return viewModel;
  }

  void _atualizaViewModel(BlocEventHubAtualizaViewModel blocEvent) async {
    BusinessModelUsuario usuarioTemp = BusinessModelUsuario(
      email: blocEvent.viewModel.usuario.email,
      nome: blocEvent.viewModel.usuario.nome,
      urlFoto: 'https://www.planetware.com/wpimages/2020/02/france-in-pictures-beautiful-places-to-photograph-eiffel-tower.jpg',
    );

    ViewModelHub viewModelTmp = ViewModelHub(
      usuario: usuarioTemp,
      cidade: BusinessModelCidade.vazio(),
      principaisTiposDeServicoCidade: BusinessModelPrincipaisTiposDeServicoCidade.vazio(),
    );
    this.sendViewModelOut(viewModelTmp);

    //String urlFoto = await ProviderUsuario().getUrlFotoById(usuario.id);

    BusinessModelUsuario usuario = BusinessModelUsuario(
      email: blocEvent.viewModel.usuario.email,
      nome: blocEvent.viewModel.usuario.nome,
      urlFoto: 'https://www.planetware.com/wpimages/2020/02/france-in-pictures-beautiful-places-to-photograph-eiffel-tower.jpg',
    );
    debugPrint(blocEvent.viewModel.cidade.id);

    ViewModelHub _viewModel = await _aplicaCidadeNoViewModel(usuario, blocEvent.viewModel.cidade.id);

    ViewModelHub viewModel =
        ViewModelHub(usuario: usuario, cidade: _viewModel.cidade, principaisTiposDeServicoCidade: _viewModel.principaisTiposDeServicoCidade);
    this.sendViewModelOut(viewModel);
  }
}
