import 'package:projeto_treinamento/businessModels/businessModelAvaliacaoPrestadorDeServico.dart';
import 'package:projeto_treinamento/businessModels/businessModelIcone.dart';
import 'package:projeto_treinamento/businessModels/businessModelPrestadorDeServicos.dart';
import 'package:projeto_treinamento/framework/bloc.dart';
import 'package:projeto_treinamento/providers/avaliacaoPrestadorDeServico/providerAvaliacaoPrestadorDeServico.dart';
import 'package:projeto_treinamento/providers/icone/providerIcone.dart';

import '../../providers/prestadoresDeServicoPorCidadeTipoDeServico/providerPrestadoresDeServicoPorCidadeTipoDeServico.dart';
import 'blocEventInfoPrestadorDeServico.dart';
import 'viewModelInfoPrestadorDeServico.dart';

class BlocInfoPrestadorDeServico extends Bloc<ViewModelInfoPrestadorDeServico,
    BlocEventInfoPrestadorDeServico> {
  @override
  void onReceiveBlocEvent(BlocEventInfoPrestadorDeServico blocEvent) {
    if (blocEvent is BlocEventInfoPrestadorDeServicoInicializaViewModel)
      _inicializaViewModel(blocEvent);
  }

  void _inicializaViewModel(
      BlocEventInfoPrestadorDeServicoInicializaViewModel blocEvent) async {
    ViewModelInfoPrestadorDeServico viewModel;

    BusinessModelPrestadorDeServicos prestadorDeServicos =
        blocEvent.prestadorDeServicos;
    viewModel = ViewModelInfoPrestadorDeServico(
      prestadorDeServicos: prestadorDeServicos,
      listaAvaliacoesPrestadorDeServico: List.empty(growable: true),
      cidade: blocEvent.cidade,
      tiposDeServico: blocEvent.tipoServico,
    );
    this.sendViewModelOut(viewModel);

    List<BusinessModelAvaliacaoPrestadorDeServico>
        listaAvaliacoesPrestadorDeServico;
    if (prestadorDeServicos.totalDeAvaliacoes > 0) {
      print(await ProviderPrestadoresDeServicoPorCidadeTipoDeServico().getComentarios().toString());

      listaAvaliacoesPrestadorDeServico =
          (await ProviderPrestadoresDeServicoPorCidadeTipoDeServico().getComentarios()).cast<BusinessModelAvaliacaoPrestadorDeServico>();
    } else {
      listaAvaliacoesPrestadorDeServico = List.empty();
    }
    viewModel = ViewModelInfoPrestadorDeServico(
      prestadorDeServicos: prestadorDeServicos,
      listaAvaliacoesPrestadorDeServico: listaAvaliacoesPrestadorDeServico,
      cidade: blocEvent.cidade,
      tiposDeServico: blocEvent.tipoServico,
    );
    this.sendViewModelOut(viewModel);
  }
}
