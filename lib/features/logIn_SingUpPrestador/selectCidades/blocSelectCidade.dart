import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:projeto_treinamento/businessModels/businessModelCidade.dart';
import 'package:projeto_treinamento/businessModels/businessModelPrincipaisTiposDeServicoCidade.dart';
import 'package:projeto_treinamento/businessModels/businessModelUsuario.dart';
import 'package:projeto_treinamento/framework/bloc.dart';
import 'package:projeto_treinamento/framework/viewModelLista.dart';
import 'package:projeto_treinamento/providers/principaisTiposDeServicoCidade/providerPrincipaisTiposDeServicoCidade.dart';

import '../../../providers/cidade/providerCidade.dart';
import 'blocEventSelectCidade.dart';
import 'featureModelSelectCidade.dart';
import 'viewModelSelectCidade.dart';

class BlocSelectCidade
    extends Bloc<ViewModelSelectCidade, BlocEventSelectCidade> {
  @override
  void onReceiveBlocEvent(BlocEventSelectCidade blocEvent) {
    if (blocEvent is BlocEventSelectCidadeInicializaViewModel)
      _inicializaViewModel(blocEvent);
    if (blocEvent is BlocEventSelectCidadeAtualizaCidadesSelecionadas)
      _selecionaCidade(blocEvent);
    if (blocEvent is BlocEventSelectCidadeAplicaFiltroDePesquisa) _aplicaFiltroDePesquisa(blocEvent);

  }

  void _inicializaViewModel(
      BlocEventSelectCidadeInicializaViewModel blocEvent) async {

    final String response = await rootBundle.loadString('lib/daos/cidade/cidades.json');
    Map<String, dynamic> data = await json.decode(response);
    List<dynamic> estados = data["estados"];
    List<BusinessModelCidade> listacidades = List.empty(growable: true);
    print(estados);

    estados.forEach((estado) {
      String sigla = estado["sigla"];
      List<dynamic> cidades = estado["cidades"];
      cidades.forEach((cidade) {
        String nome = cidade + " - " + sigla;
        listacidades.add(BusinessModelCidade(
            codCidade: nome.hashCode, nome: nome, totalPrestadoresServico: 0));

      });
    });

    List<FeatureModelSelectCidade> listaCompletaFeatureModels = await _buscaListaFeatureModelCidade();
 /*   ViewModelSelectCidade viewModel = ViewModelSelectCidade(
      listaCompleta: listaCompletaFeatureModels,
      cidades: [],
      cidadesSelecionadas: [],
    );
    this.sendViewModelOut(viewModel);
*/
    ViewModelSelectCidade viewModelTmp = ViewModelSelectCidade(
      cidades: listacidades,
      cidadesSelecionadas: [],
      listaCompleta: listaCompletaFeatureModels,
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
          blocEvent.viewModel.cidades[blocEvent.idCidadeSelecionada].nome) {
        novaListaCidadesSelecionadas
            .remove(blocEvent.viewModel.cidadesSelecionadas[i]);
        removed = true;
      }
    }
    if (!removed) {
      novaListaCidadesSelecionadas
          .add(blocEvent.viewModel.cidades[blocEvent.idCidadeSelecionada]);
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
        cidades: cidades, cidadesSelecionadas: cidadesSelecionadas, listaCompleta: []);
    return viewModel;
  }

  void _aplicaFiltroDePesquisa(BlocEventSelectCidadeAplicaFiltroDePesquisa blocEvent) {
    ViewModelSelectCidade viewModel = blocEvent.viewModel;
    viewModel.aplicaFiltroDePesquisa();
    if (viewModel.listaVisivel.isEmpty) {
      print('-'*50);

      viewModel.mensagemDeErro = "Não existem cidades que contenha a palavra '${viewModel.controlerFieldPesquisa.text}'";
    } else {
      viewModel.mensagemDeErro = "";

    }
    this.sendViewModelOut(viewModel);
  }

  Future<List<FeatureModelSelectCidade>> _buscaListaFeatureModelCidade() async {
    List<BusinessModelCidade> listaBusinessModelTiposDeServico = await ProviderCidade().getBusinessModels();
    listaBusinessModelTiposDeServico.sort((a, b) {
      return a.nome.compareTo(b.nome);
    });
    List<FeatureModelSelectCidade> listaCompletaFeatureModels = List.empty(growable: true);
    listaBusinessModelTiposDeServico.forEach((businessModel) {
      FeatureModelSelectCidade featureModelSelectCidade = FeatureModelSelectCidade(
        cidade: businessModel,
      );
      listaCompletaFeatureModels.add(featureModelSelectCidade);
    });
    return listaCompletaFeatureModels;
  }


/* List<BusinessModelCidade> filterListaCidades (String value, ViewModelSelectCidade viewModel){

    List<BusinessModelCidade> listaCompleta =  viewModel.cidades;

    List<BusinessModelCidade> listaAtualizada = [];

    listaAtualizada = listaCompleta.where((element) => element.contains(value.toLowerCase())).toList();
    if (value.isNotEmpty && listaAtualizada.length == 0) {
      print('foodListSearch length ${listaAtualizada.length}');
      return listaCompleta;
    }
    print(listaAtualizada);
    return listaCompleta;
  }*/
}
