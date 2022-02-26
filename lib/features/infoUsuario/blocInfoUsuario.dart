import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';
import 'package:projeto_treinamento/businessModels/businessModelCidade.dart';
import 'package:projeto_treinamento/businessModels/businessModelUsuario.dart';
import 'package:projeto_treinamento/framework/bloc.dart';
import 'package:projeto_treinamento/providers/cidade/providerCidade.dart';
import 'package:projeto_treinamento/providers/usuario/providerUsuario.dart';
import 'viewModelInfoUsuario.dart';
import 'blocEventInfoUsuario.dart';

class BlocInfoUsuario extends Bloc<ViewModelInfoUsuario, BlocEventInfoUsuario> {
  @override
  void onReceiveBlocEvent(BlocEventInfoUsuario blocEvent) {
    if (blocEvent is BlocEventInfoUsuarioInicializaViewModel) _inicializaViewModel(blocEvent);
    if (blocEvent is BlocEventInfoUsuarioAtualizaViewModel) _atualizaViewModel(blocEvent);
  }

  void _inicializaViewModel(BlocEventInfoUsuarioInicializaViewModel blocEvent) async {
    ViewModelInfoUsuario viewModel = ViewModelInfoUsuario(
        cidade: blocEvent.viewModel.cidade, usuario: blocEvent.viewModel.usuario, listaCompletaCidade: ProviderCidade().getBusinessModels());
    this.sendViewModelOut(viewModel);
  }

  void _atualizaViewModel(BlocEventInfoUsuarioAtualizaViewModel blocEvent) {
    ViewModelInfoUsuario viewModel = ViewModelInfoUsuario(
        cidade: blocEvent.viewModel.cidade,
        usuario: blocEvent.viewModel.usuario,
        listaCompletaCidade: blocEvent.viewModel.listaCompletaCidade,
        imagemAtualizada: blocEvent.viewModel.imagemAtualizada);
    this.sendViewModelOut(viewModel);
    BusinessModelUsuario businessModel = BusinessModelUsuario(email: viewModel.usuario.email, nome: viewModel.usuario.nome, urlFoto: viewModel.usuario.urlFoto);
    ProviderUsuario().saveBusinessModel(businessModel);
  }
}
