import 'package:projeto_treinamento/features/infoPrestadorDeServico/viewModelInfoPrestadorDeServico.dart';
import 'package:projeto_treinamento/framework/pipe.dart';
import 'package:projeto_treinamento/framework/viewActions.dart';
import 'package:projeto_treinamento/util/prestador.dart';
import 'blocEventInfoPrestadorDeServico.dart';

class ViewActionsInfoPrestadorDeServico
    extends ViewActions<BlocEventInfoPrestadorDeServico> {
  ViewActionsInfoPrestadorDeServico(
      Pipe<BlocEventInfoPrestadorDeServico> blocPipeIn)
      : super(blocPipeIn);

  Future<void> AtualizaTelaPrestadorDeServico(
      ViewModelInfoPrestadorDeServico viewModel) async {
    BlocEventInfoPrestadorDeServicoInicializaViewModel blocEvent =
        BlocEventInfoPrestadorDeServicoInicializaViewModel(
      viewModel.prestadorDeServicos,
      viewModel.cidade,
      viewModel.tiposDeServico,
    );
    blocPipeIn.send(blocEvent);
  }
}
