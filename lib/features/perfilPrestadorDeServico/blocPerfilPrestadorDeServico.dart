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
      cidade: blocEvent.viewModel.cidade,
      usuario: blocEvent.viewModel.usuario,
      listaCompletaCidade: ProviderCidade().getBusinessModels(),
    );

    this.sendViewModelOut(viewModel);
  }

  void _atualizaViewModel(
      BlocEventPerfilPrestadorDeServicoAtualizaViewModel blocEvent) {
    ViewModelPerfilPrestadorDeServico viewModel =
        ViewModelPerfilPrestadorDeServico(
      cidade: blocEvent.viewModel.cidade,
      usuario: blocEvent.viewModel.usuario,
      listaCompletaCidade: blocEvent.viewModel.listaCompletaCidade,
      imagemAtualizada: blocEvent.viewModel.imagemAtualizada,
    );
    this.sendViewModelOut(viewModel);
    BusinessModelUsuario businessModel = BusinessModelUsuario(
      email: viewModel.usuario.email,
      nome: viewModel.usuario.nome,
      urlFoto: viewModel.usuario.urlFoto,
      description: viewModel.usuario.description,
      roles: viewModel.usuario.roles,
      city: viewModel.usuario.city,
      brazilianIDpicture: viewModel.usuario.brazilianIDpicture,
      phone: viewModel.usuario.phone,
      brazilianID: viewModel.usuario.brazilianID,
      workingHours: viewModel.usuario.workingHours,
    );
    ProviderUsuario().saveBusinessModel(businessModel);
  }
}
