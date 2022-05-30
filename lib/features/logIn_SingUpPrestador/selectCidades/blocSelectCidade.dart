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

    final String response =
        await rootBundle.loadString('lib/daos/cidade/cidades.json');
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
    ViewModelSelectCidade viewModelTmp = ViewModelSelectCidade(
      cidades: listacidades,
      cidadesSelecionadas: [],
      listaCompleta: [],
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
      viewModel.mensagemDeErro = "Não existem cidades que contenha a palavra '${viewModel.controlerFieldPesquisa.text}'";
    } else {
      viewModel.mensagemDeErro = "";
    }
    this.sendViewModelOut(viewModel);
  }



  List<String> filterCidadesSelecionadas (value){
    final TextEditingController controlerFieldPesquisa = TextEditingController();
    List<String> listacidades =['aasa', 'asas', 'asas', 'ass'];

    List<String> listaAtualizada =[];
    listaAtualizada = listacidades
          .where(
              (element) => element.toLowerCase().contains(value.toLowerCase()))
          .toList();
      if (controlerFieldPesquisa.text.isNotEmpty &&
          listaAtualizada.length == 0) {
        print('foodListSearch length ${listaAtualizada.length}');
        return listacidades;
      }
        print(listaAtualizada);
        return listacidades;

    }
}
