import 'blocCadastroPrestadorDeServico.dart';
import 'viewModelCadastroPrestadorDeServico.dart';

class PresenterCadastroPrestadorDeServico {
  ViewModelCadastroPrestadorDeServico getViewModel() {
    BlocCadastroPrestadorDeServico bloc = BlocCadastroPrestadorDeServico();
    return bloc.getViewModel();
  }
}
