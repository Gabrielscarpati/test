import 'package:projeto_treinamento/businessModels/businessModelCidade.dart';
import 'package:projeto_treinamento/features/pesquisaCidade/viewModelPesquisaCidade.dart';
import 'package:projeto_treinamento/framework/bloc.dart';
import 'package:projeto_treinamento/providers/cidade/providerCidade.dart';
import 'package:projeto_treinamento/util/cidade.dart';
import 'blocEventPesquisaCidade.dart';
import 'featureModelPesquisaCidade.dart';

class BlocPesquisaCidade
    extends Bloc<ViewModelPesquisaCidade, BlocEventPesquisaCidade> {
  @override
  void onReceiveBlocEvent(BlocEventPesquisaCidade blocEvent) {
    if (blocEvent is BlocEventPesquisaCidadeInicializaViewModel)
      _inicializaViewModel(blocEvent);
    if (blocEvent is BlocEventPesquisaCidadeAplicaFiltroDePesquisa)
      _aplicaFiltroDePesquisa(blocEvent);
  } // abrir whataspp

  void _inicializaViewModel(
      BlocEventPesquisaCidadeInicializaViewModel blocEvent) async {
    List<FeatureModelPesquisaCidade> listaCompletaFeatureModels =
        await _buscaListaFeatureModelCidade();
    ViewModelPesquisaCidade viewModel = ViewModelPesquisaCidade(
      listaCompleta: listaCompletaFeatureModels,
    );
    this.sendViewModelOut(viewModel);
  }

// colocar os dado iniciais em uma tela

  void _aplicaFiltroDePesquisa(
      BlocEventPesquisaCidadeAplicaFiltroDePesquisa blocEvent) {
    ViewModelPesquisaCidade viewModel = blocEvent.viewModel;
    viewModel.aplicaFiltroDePesquisa();
    if (viewModel.listaVisivel.isEmpty) {
      viewModel.mensagemDeErro =
          "Não existem cidades que contenha a palavra '${viewModel.controlerFieldPesquisa.text}'";
    } else {
      viewModel.mensagemDeErro = "";
    }
    this.sendViewModelOut(viewModel);
  }

  Future<List<FeatureModelPesquisaCidade>>
      _buscaListaFeatureModelCidade() async {
    List<BusinessModelCidade> listaBusinessModelTiposDeServico =
        Cidades().listaDeTodasAsCidades;

    List<FeatureModelPesquisaCidade> listaCompletaFeatureModels =
        List.empty(growable: true);
    listaBusinessModelTiposDeServico.forEach((businessModel) {
      FeatureModelPesquisaCidade featureModelPesquisaCidade =
          FeatureModelPesquisaCidade(
        cidade: businessModel,
      );
      listaCompletaFeatureModels.add(featureModelPesquisaCidade);
    });
    return listaCompletaFeatureModels;
  }
}
