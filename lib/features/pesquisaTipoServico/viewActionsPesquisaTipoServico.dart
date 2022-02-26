import 'package:projeto_treinamento/features/pesquisaTipoServico/viewModelPesquisaTipoServico.dart';
import 'package:projeto_treinamento/framework/pipe.dart';
import 'package:projeto_treinamento/framework/viewActions.dart';

import 'blocEventPesquisaTipoServico.dart';

class ViewActionsPesquisaTipoServico extends ViewActions<BlocEventPesquisaTipoServico> {
  ViewActionsPesquisaTipoServico(Pipe<BlocEventPesquisaTipoServico> blocPipeIn) : super(blocPipeIn);

  void aplicaFiltroPesquisa(ViewModelPesquisaTipoServico viewModel) {
    BlocEventPesquisaTipoServicoAplicaFiltroDePesquisa blocEvent = BlocEventPesquisaTipoServicoAplicaFiltroDePesquisa(viewModel);
    blocPipeIn.send(blocEvent);
  }
}
