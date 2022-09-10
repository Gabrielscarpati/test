import 'package:projeto_treinamento/businessModels/businessModelPrestadorDeServicos.dart';
import 'package:projeto_treinamento/framework/bloc.dart';
import '../../businessModel/businessModelVerifyIdentity.dart';
import '../../providers/VerifyIdentity/providerVerifyIdentity.dart';
import 'blocEventListaVerifyIdentity.dart';
import 'viewModelListaVerifyIdentity.dart';

class BlocListaVerifyIdentity extends Bloc<
    ViewModelListaVerifyIdentity, BlocEventListaVerifyIdentity> {
  @override
  void onReceiveBlocEvent(BlocEventListaVerifyIdentity blocEvent) {
    if (blocEvent is BlocEventListaVerifyIdentityInicializaViewModel)
      _inicializaViewModel(blocEvent);
    if (blocEvent is BlocEventListaVerifyIdentityAplicaFiltroDePesquisa)
      _aplicaFiltroDePesquisa(blocEvent);
  }

  void _inicializaViewModel(BlocEventListaVerifyIdentityInicializaViewModel blocEvent) async {
    List<BusinessModelVerifyIdentity> listaCompleta;

    listaCompleta = await ProviderVerifyIdentity().getBusinessModels();

    ViewModelListaVerifyIdentity viewModel = ViewModelListaVerifyIdentity(
      listaCompleta: listaCompleta,
    );
    this.sendViewModelOut(viewModel);
  }

  void _aplicaFiltroDePesquisa(
      BlocEventListaVerifyIdentityAplicaFiltroDePesquisa blocEvent) {
    ViewModelListaVerifyIdentity viewModel = blocEvent.viewModel;
    viewModel.aplicaFiltroDePesquisa();
    this.sendViewModelOut(viewModel);
  }
}
