import 'package:projeto_treinamento/businessModels/businessModelTiposDeServico.dart';
import 'package:projeto_treinamento/features/pesquisaTipoServico/viewModelPesquisaTipoServico.dart';
import 'package:projeto_treinamento/framework/bloc.dart';

import 'blocEventPesquisaTipoServico.dart';

class BlocPesquisaTipoServico
    extends Bloc<ViewModelPesquisaTipoServico, BlocEventPesquisaTipoServico> {
  @override
  void onReceiveBlocEvent(BlocEventPesquisaTipoServico blocEvent) {
    if (blocEvent is BlocEventPesquisaTipoServicoInicializaViewModel)
      _inicializaViewModel(blocEvent);
    if (blocEvent is BlocEventPesquisaTipoServicoAplicaFiltroDePesquisa)
      _aplicaFiltroDePesquisa(blocEvent);
  }

  void _inicializaViewModel(
      BlocEventPesquisaTipoServicoInicializaViewModel blocEvent) async {
    List<BusinessModelTiposDeServico> listaCompletaFeatureModels =
        List.empty(growable: true);
    blocEvent.principaisTiposDeServicoCidade.tiposDeServico
        .forEach((tipoDeServico) {
      if (tipoDeServico.qtdePrestadoresDeServico > 0)
        listaCompletaFeatureModels.add(tipoDeServico);
    });
    listaCompletaFeatureModels.sort((a, b) {
      return a.descricao.compareTo(b.descricao);
    });
    ViewModelPesquisaTipoServico viewModel = ViewModelPesquisaTipoServico(
      listaCompleta: listaCompletaFeatureModels,
    );
    this.sendViewModelOut(viewModel);
  }

  void _aplicaFiltroDePesquisa(
      BlocEventPesquisaTipoServicoAplicaFiltroDePesquisa blocEvent) {
    ViewModelPesquisaTipoServico viewModel = blocEvent.viewModel;
    viewModel.aplicaFiltroDePesquisa();
    if (viewModel.listaVisivel.isEmpty) {
      viewModel.mensagemDeErro =
          "Não existem tipos de serviço que contenha a palavra '${viewModel.controlerFieldPesquisa.text}'";
    } else {
      viewModel.mensagemDeErro = "";
    }
    this.sendViewModelOut(viewModel);
  }
}
