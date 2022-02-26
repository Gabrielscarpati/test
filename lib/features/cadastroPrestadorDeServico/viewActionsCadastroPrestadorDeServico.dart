import 'package:projeto_treinamento/features/cadastroPrestadorDeServico/blocCadastroPrestadorDeServico.dart';
import 'package:projeto_treinamento/features/cadastroPrestadorDeServico/viewModelCadastroPrestadorDeServico.dart';
import 'package:projeto_treinamento/util/resposta_processamento.dart';

class ViewActionsCadastroPrestadorDeServico {
  RespostaProcessamento gravaValores(ViewModelCadastroPrestadorDeServico viewModel) {
    BlocCadastroPrestadorDeServico bloc = BlocCadastroPrestadorDeServico();
    return bloc.gravaCadastroPrestadorDeServico(viewModel);
  }
}
