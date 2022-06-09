import 'package:projeto_treinamento/features/pesquisaCidade/viewModelPesquisaCidade.dart';
import 'package:projeto_treinamento/framework/pipe.dart';
import 'package:projeto_treinamento/framework/viewActions.dart';

import 'blocEventPesquisaCidade.dart';

class ViewActionsPesquisaCidade extends ViewActions<BlocEventPesquisaCidade> {
  ViewActionsPesquisaCidade(Pipe<BlocEventPesquisaCidade> blocPipeIn) : super(blocPipeIn);

  void aplicaFiltroPesquisa(ViewModelPesquisaCidade viewModel) {
    print('aplicaFiltroPesquisa');
    print( DateTime.now().toString());
    BlocEventPesquisaCidadeAplicaFiltroDePesquisa blocEvent = BlocEventPesquisaCidadeAplicaFiltroDePesquisa(viewModel);
    blocPipeIn.send(blocEvent);
  }
}


// aciona eventos do bloc,