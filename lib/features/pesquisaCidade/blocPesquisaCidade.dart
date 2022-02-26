import 'package:projeto_treinamento/businessModels/businessModelCidade.dart';
import 'package:projeto_treinamento/framework/bloc.dart';
import 'package:projeto_treinamento/providers/cidade/providerCidade.dart';
import 'package:projeto_treinamento/providers/icone/providerIcone.dart';

import 'blocEventPesquisaCidade.dart';
import 'featureModelPesquisaCidade.dart';
import 'viewModelPesquisaCidade.dart';

class BlocPesquisaCidade extends Bloc<ViewModelPesquisaCidade, BlocEventPesquisaCidade> {
  @override
  void onReceiveBlocEvent(BlocEventPesquisaCidade blocEvent) {
    if (blocEvent is BlocEventPesquisaCidadeInicializaViewModel) _inicializaViewModel(blocEvent);
    if (blocEvent is BlocEventPesquisaCidadeAplicaFiltroDePesquisa) _aplicaFiltroDePesquisa(blocEvent);
  }

  void _inicializaViewModel(BlocEventPesquisaCidadeInicializaViewModel blocEvent) async {
    List<FeatureModelPesquisaCidade> listaCompletaFeatureModels = await _buscaListaFeatureModelCidade();
    ViewModelPesquisaCidade viewModel = ViewModelPesquisaCidade(
      listaCompleta: listaCompletaFeatureModels,
      iconeCidade: await ProviderIcone().Cidade(),
    );
    this.sendViewModelOut(viewModel);
  }

  void _aplicaFiltroDePesquisa(BlocEventPesquisaCidadeAplicaFiltroDePesquisa blocEvent) {
    ViewModelPesquisaCidade viewModel = blocEvent.viewModel;
    viewModel.aplicaFiltroDePesquisa();
    if (viewModel.listaVisivel.isEmpty) {
      viewModel.mensagemDeErro = "Não existem cidades que contenha a palavra '${viewModel.controlerFieldPesquisa.text}'";
    } else {
      viewModel.mensagemDeErro = "";
    }
    this.sendViewModelOut(viewModel);
  }

  Future<List<FeatureModelPesquisaCidade>> _buscaListaFeatureModelCidade() async {
    List<BusinessModelCidade> listaBusinessModelTiposDeServico = await ProviderCidade().getBusinessModels();
    listaBusinessModelTiposDeServico.sort((a, b) {
      return a.nome.compareTo(b.nome);
    });
    List<FeatureModelPesquisaCidade> listaCompletaFeatureModels = List.empty(growable: true);
    listaBusinessModelTiposDeServico.forEach((businessModel) {
      FeatureModelPesquisaCidade featureModelPesquisaCidade = FeatureModelPesquisaCidade(
        cidade: businessModel,
      );
      listaCompletaFeatureModels.add(featureModelPesquisaCidade);
    });
    return listaCompletaFeatureModels;
  }
}
