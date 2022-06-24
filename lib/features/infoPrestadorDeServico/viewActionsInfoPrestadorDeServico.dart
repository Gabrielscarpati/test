import 'package:projeto_treinamento/features/infoPrestadorDeServico/viewModelInfoPrestadorDeServico.dart';
import 'package:projeto_treinamento/framework/pipe.dart';
import 'package:projeto_treinamento/framework/viewActions.dart';
import 'blocEventInfoPrestadorDeServico.dart';

class ViewActionsInfoPrestadorDeServico extends ViewActions<BlocEventInfoPrestadorDeServico> {
  ViewActionsInfoPrestadorDeServico(Pipe<BlocEventInfoPrestadorDeServico> blocPipeIn) : super(blocPipeIn);

  void AtualizaTelaPrestadorDeServico(ViewModelInfoPrestadorDeServico viewModel) {
    BlocEventInfoPrestadorDeServicoInicializaViewModel blocEvent =
        BlocEventInfoPrestadorDeServicoInicializaViewModel(viewModel.prestadorDeServicos, viewModel.cidade, viewModel.tiposDeServico,);
    blocPipeIn.send(blocEvent);
  }
}


