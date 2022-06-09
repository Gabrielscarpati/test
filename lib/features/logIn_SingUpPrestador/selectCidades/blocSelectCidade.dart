import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:projeto_treinamento/businessModels/businessModelCidade.dart';
import 'package:projeto_treinamento/framework/bloc.dart';
import '../../../daos/firebase/updatePrestadorFirebase.dart';
import '../../../providers/cidade/providerCidade.dart';
import 'blocEventSelectCidade.dart';
import 'viewModelSelectCidade.dart';

class BlocSelectCidade
    extends Bloc<ViewModelSelectCidade, BlocEventSelectCidade> {
  @override
  void onReceiveBlocEvent(BlocEventSelectCidade blocEvent) {
    print('onReceiveBlocEvent');
    print( DateTime.now().toString());
    if (blocEvent is BlocEventSelectCidadeInicializaViewModel)
      _inicializaViewModel(blocEvent);

    if (blocEvent is BlocEventSelectCidadeAtualizaCidadesSelecionadas)
      _selecionaCidade(blocEvent);

    if (blocEvent is BlocEventSelectCidadeAplicaFiltroDePesquisa)
      _aplicaFiltroDePesquisa(blocEvent);

    if (blocEvent is BlocEventSavarListaSelecionadaFirebase)
      _savarListaSelecionadaFirebase(blocEvent);
  }

  void _inicializaViewModel(
      BlocEventSelectCidadeInicializaViewModel blocEvent) async {
    List<BusinessModelCidade> listaCompletaBusinessModels =
        await _buscaListaBusinessModelCidade();

    ViewModelSelectCidade viewModelTmp = ViewModelSelectCidade(
      cidades: listaCompletaBusinessModels,
      cidadesSelecionadas: [],
      listaCompleta: listaCompletaBusinessModels,
    );
    this.sendViewModelOut(viewModelTmp);
  }

  void _selecionaCidade(
      BlocEventSelectCidadeAtualizaCidadesSelecionadas blocEvent) async {
    List<BusinessModelCidade> novaListaCidadesSelecionadas =
        blocEvent.viewModel.cidadesSelecionadas;
    bool removed = false;

    for (int i = 0; i < blocEvent.viewModel.cidadesSelecionadas.length; i++) {
      if (blocEvent.viewModel.cidadesSelecionadas[i].nome ==
          blocEvent
              .viewModel.listaVisivel[blocEvent.idCidadeSelecionada].nome) {
        novaListaCidadesSelecionadas
            .remove(blocEvent.viewModel.cidadesSelecionadas[i]);
        removed = true;
      }
    }
    if (!removed) {
      novaListaCidadesSelecionadas
          .add(blocEvent.viewModel.listaVisivel[blocEvent.idCidadeSelecionada]);
    }

    ViewModelSelectCidade viewModel = await _aplicaCidadeSelecionadaNoViewModel(
      novaListaCidadesSelecionadas,
      blocEvent.viewModel.cidades,
    );
    this.sendViewModelOut(viewModel);
  }

  Future<ViewModelSelectCidade> _aplicaCidadeSelecionadaNoViewModel(
      List<BusinessModelCidade> cidadesSelecionadas,
      List<BusinessModelCidade> cidades) async {
    ViewModelSelectCidade viewModel = ViewModelSelectCidade(
        cidades: cidades,
        cidadesSelecionadas: cidadesSelecionadas,
        listaCompleta: []);
    return viewModel;
  }

  void _aplicaFiltroDePesquisa(
      BlocEventSelectCidadeAplicaFiltroDePesquisa blocEvent) {
    ViewModelSelectCidade viewModel = blocEvent.viewModel;
    viewModel.aplicaFiltroDePesquisa();
    if (viewModel.listaVisivel.isEmpty) {
      viewModel.mensagemDeErro =
          "Não existem cidades que contenha a palavra '${viewModel.controlerFieldPesquisa.text}'";
    } else {
      viewModel.mensagemDeErro = "";
    }
    this.sendViewModelOut(viewModel);
  }

  Future<List<BusinessModelCidade>> _buscaListaBusinessModelCidade() async {
    List<BusinessModelCidade> listaBusinessModelSelectCidade =
        await ProviderCidade().getBusinessModels();
    listaBusinessModelSelectCidade.sort((a, b) {
      return a.nome.compareTo(b.nome);
    });
    return listaBusinessModelSelectCidade;
  }

  void _savarListaSelecionadaFirebase(
      BlocEventSavarListaSelecionadaFirebase blocEvent) {
    ViewModelSelectCidade viewModel = blocEvent.viewModel;
    List<String> cidades = [];
    viewModel.cidadesSelecionadas.forEach((element) {
      cidades.add(element.nome);
    });

    UpdateCidadePrestador updatePrestadorFirebase = UpdateCidadePrestador(
      cidades: cidades,
    );
    updatePrestadorFirebase.updateCidadePrestador();
  }
}
