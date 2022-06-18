import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:projeto_treinamento/businessModels/businessModelCidade.dart';
import 'package:projeto_treinamento/framework/bloc.dart';
import '../../../daos/firebase/updatePrestadorFirebase.dart';
import '../../../daos/listaDeServicos/listaDeServicos.dart';
import '../../../providers/cidade/providerCidade.dart';
import 'blocEventSelectServicos.dart';
import 'viewModelSelectServicos.dart';

class BlocSelectServicos
    extends Bloc<ViewModelSelectServicos, BlocEventSelectServicos> {
  @override
  void onReceiveBlocEvent(BlocEventSelectServicos blocEvent) {
    if (blocEvent is BlocEventSelectServicosInicializaViewModel)
      _inicializaViewModel(blocEvent);
    if (blocEvent is BlocEventSelectServicosAtualizaServicosSelecionados)
      _selecionaServicos(blocEvent);
    if (blocEvent is BlocEventSelectServicosAplicaFiltroDePesquisa) _aplicaFiltroDePesquisa(blocEvent);
    if (blocEvent is BlocEventSavarListaSelecionadaFirebase) _savarListaSelecionadaFirebase(blocEvent);
  }


  void _inicializaViewModel(BlocEventSelectServicosInicializaViewModel blocEvent) async {
    GetListaServicosFirebase getListaServicosFirebase = GetListaServicosFirebase();


    List<BusinessModelCidade> listacidades = List.empty(growable: true);
    final List listaServices = await getListaServicosFirebase.getListaServicosFirebase() as List;

    for(int i = 0; i<listaServices.length; i++){
      listacidades.add(
        BusinessModelCidade(codCidade: listaServices[i].hashCode, nome: listaServices[i], totalPrestadoresServico: 0)
      );
    }
    //Pq da esse erro??
   // [ERROR:flutter/runtime/dart_vm_initializer.cc(39)] Unhandled Exception: type 'String' is not a subtype of type 'int'

    List<BusinessModelCidade> listaCompletaBusinessModels = await _buscaListaBusinessModelCidade();

    ViewModelSelectServicos viewModelTmp = ViewModelSelectServicos(
      cidades: listacidades,
      cidadesSelecionadas: [],
      listaCompleta: listaCompletaBusinessModels,
    );
    this.sendViewModelOut(viewModelTmp);
  }

  void _selecionaServicos(
      BlocEventSelectServicosAtualizaServicosSelecionados blocEvent) async {
    List<BusinessModelCidade> novaListaCidadesSelecionadas =
        blocEvent.viewModel.cidadesSelecionadas;
    bool removed = false;

    for (int i = 0; i < blocEvent.viewModel.cidadesSelecionadas.length; i++) {
      if (blocEvent.viewModel.cidadesSelecionadas[i].nome ==
          blocEvent.viewModel.listaVisivel[blocEvent.idCidadeSelecionada].nome) {
        novaListaCidadesSelecionadas
            .remove(blocEvent.viewModel.cidadesSelecionadas[i]);
        removed = true;
      }
    }
    if (!removed) {
      novaListaCidadesSelecionadas
          .add(blocEvent.viewModel.listaVisivel[blocEvent.idCidadeSelecionada]);
    }

    ViewModelSelectServicos viewModel = await _aplicaCidadeSelecionadaNoViewModel(
      novaListaCidadesSelecionadas,
      blocEvent.viewModel.cidades,
    );
    this.sendViewModelOut(viewModel);
  }

  Future<ViewModelSelectServicos> _aplicaCidadeSelecionadaNoViewModel(
      List<BusinessModelCidade> cidadesSelecionadas,
      List<BusinessModelCidade> cidades) async {
    ViewModelSelectServicos viewModel = ViewModelSelectServicos(
        cidades: cidades, cidadesSelecionadas: cidadesSelecionadas, listaCompleta: []);
    return viewModel;
  }

  void _aplicaFiltroDePesquisa(BlocEventSelectServicosAplicaFiltroDePesquisa blocEvent) {
    ViewModelSelectServicos viewModel = blocEvent.viewModel;
    viewModel.aplicaFiltroDePesquisa();
    if (viewModel.listaVisivel.isEmpty) {

      viewModel.mensagemDeErro = "Não existem cidades que contenha a palavra '${viewModel.controlerFieldPesquisa.text}'";
    } else {
      viewModel.mensagemDeErro = "";

    }
    this.sendViewModelOut(viewModel);
  }

  Future<List<BusinessModelCidade>> _buscaListaBusinessModelCidade() async {
    List<BusinessModelCidade> listaBusinessModelSelectCidade = await ProviderCidade().getBusinessModels();
    listaBusinessModelSelectCidade.sort((a, b) {
      return a.nome.compareTo(b.nome);
    });
    return listaBusinessModelSelectCidade;
  }


    void _savarListaSelecionadaFirebase(BlocEventSavarListaSelecionadaFirebase blocEvent){
      ViewModelSelectServicos viewModel = blocEvent.viewModel;

      int index = 0;
      List<int> servicos = [];
      viewModel.cidadesSelecionadas.forEach((element) {
        servicos.add(index);
        index++;
        }
      );
      /*
      SetPrestadorInformationCompleta(
        roles: servicos,
      );*/
  }
}
