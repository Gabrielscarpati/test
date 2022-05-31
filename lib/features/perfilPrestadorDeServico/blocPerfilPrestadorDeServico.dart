import 'package:projeto_treinamento/businessModels/businessModelUsuario.dart';
import 'package:projeto_treinamento/features/perfilPrestadorDeServico/blocEventPerfilPrestadorDeServico.dart';
import 'package:projeto_treinamento/framework/bloc.dart';
import 'package:projeto_treinamento/providers/cidade/providerCidade.dart';
import 'package:projeto_treinamento/providers/usuario/providerUsuario.dart';
import 'viewModelPerfilPrestadorDeServico.dart';

class BlocPerfilPrestadorDeServico extends Bloc<
    ViewModelPerfilPrestadorDeServico, BlocEventPerfilPrestadorDeServico> {
  @override
  void onReceiveBlocEvent(BlocEventPerfilPrestadorDeServico blocEvent) {
    if (blocEvent is BlocEventPerfilPrestadorDeServicoInicializaViewModel)
      _inicializaViewModel(blocEvent);
    if (blocEvent is BlocEventPerfilPrestadorDeServicoAtualizaViewModel)
      _atualizaViewModel(blocEvent);
  }

  void _inicializaViewModel(
      BlocEventPerfilPrestadorDeServicoInicializaViewModel blocEvent) async {
    ViewModelPerfilPrestadorDeServico viewModel =

    ViewModelPerfilPrestadorDeServico(
        prestadorInformation: blocEvent.viewModel.prestadorInformation);


    this.sendViewModelOut(viewModel);
  }

  void _atualizaViewModel(
      BlocEventPerfilPrestadorDeServicoAtualizaViewModel blocEvent) {
    ViewModelPerfilPrestadorDeServico viewModel =

    ViewModelPerfilPrestadorDeServico(
        prestadorInformation: blocEvent.viewModel.prestadorInformation);


    this.sendViewModelOut(viewModel);
  }
}