import 'package:projeto_treinamento/businessModels/businessModelPrestadorDeServicos.dart';
import 'package:projeto_treinamento/businessModels/businessModelPrestadoresDeServicoPorCidadeTipoDeServico.dart';
import 'package:projeto_treinamento/features/listaPrestadoresDeServico/blocEventListaPrestadoresDeServico.dart';
import 'package:projeto_treinamento/framework/bloc.dart';
import 'package:projeto_treinamento/providers/icone/providerIcone.dart';
import 'package:projeto_treinamento/providers/prestadoresDeServicoPorCidadeTipoDeServico/providerPrestadoresDeServicoPorCidadeTipoDeServico.dart';

import 'viewModelListaPrestadoresDeServico.dart';

class BlocListaPrestadoresDeServico extends Bloc<ViewModelListaPrestadoresDeServico, BlocEventListaPrestadoresDeServico> {
  @override
  void onReceiveBlocEvent(BlocEventListaPrestadoresDeServico blocEvent) {
    if (blocEvent is BlocEventListaPrestadoresDeServicoInicializaViewModel) _inicializaViewModel(blocEvent);
    if (blocEvent is BlocEventListaPrestadoresDeServicoAplicaFiltroDePesquisa) _aplicaFiltroDePesquisa(blocEvent);
  }

  void _inicializaViewModel(BlocEventListaPrestadoresDeServicoInicializaViewModel blocEvent) async {
    BusinessModelPrestadoresDeServicoPorCidadeTipoDeServico businessModel = await ProviderPrestadoresDeServicoPorCidadeTipoDeServico()
        .getBusinessModel(blocEvent.codCidade.toString() + "-" + blocEvent.codTipoDeServico.toString());
    List<BusinessModelPrestadorDeServicos> listaCompleta;
    listaCompleta = businessModel.prestadoresDeServico;
    listaCompleta.sort((a, b) => a.nota > b.nota ? -1 : 1);

    ViewModelListaPrestadoresDeServico viewModel = ViewModelListaPrestadoresDeServico(
      listaCompleta: listaCompleta,
      cidade: businessModel.cidade,
      tiposDeServico: businessModel.tipoDeServico,
      iconeStatusOnline: await ProviderIcone().whatsApp(),
    );
    this.sendViewModelOut(viewModel);
  }

  void _aplicaFiltroDePesquisa(BlocEventListaPrestadoresDeServicoAplicaFiltroDePesquisa blocEvent) {
    ViewModelListaPrestadoresDeServico viewModel = blocEvent.viewModel;
    viewModel.aplicaFiltroDePesquisa();
    this.sendViewModelOut(viewModel);
  }
}

/*

100 (user) ratings of 4: (3*2 + 100*4) / (3 + 100) = 3.94
3 ratings of 5 and 1 rating of 4: (3*2 + 3*5 + 1*4) / (3 + 3 + 1) = 3.57
10 ratings of 4: (3*2 + 10*4) / (3 + 10) = 3.54
1 rating of 5: (3*2 + 1*5) / (3 + 1) = 2.75
No user ratings: (3*2 + 0) / (3 + 0) = 2
1 rating of 1: (3*2 + 1*1) / (3 + 1) = 1.75

R = 2
W = 3

1 rating of 1: (3*2 + 1*1) / (3 + 1) = 1.75
 (W*R + Q1*1 + Q2*2 + Q3*3 + Q4*4 + Q5*5) / (W + Q1 + Q2 + Q3 + Q4 + Q5)

 */
