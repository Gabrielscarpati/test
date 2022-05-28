import 'dart:typed_data';
import 'package:image_picker/image_picker.dart';
import 'package:projeto_treinamento/businessModels/businessModelCidade.dart';
import 'package:projeto_treinamento/businessModels/businessModelPrestadorInfomation.dart';
import 'package:projeto_treinamento/businessModels/businessModelUsuario.dart';
import 'package:projeto_treinamento/features/perfilPrestadorDeServico/blocEventPerfilPrestadorDeServico.dart';
import 'package:projeto_treinamento/features/perfilPrestadorDeServico/viewModelPerfilPrestadorDeServico.dart';
import 'package:projeto_treinamento/framework/pipe.dart';
import 'package:projeto_treinamento/framework/viewActions.dart';
import 'package:projeto_treinamento/providers/cidade/providerCidade.dart';

class ViewActionsPerfilPrestadorDeServico
    extends ViewActions<BlocEventPerfilPrestadorDeServico> {
  ViewActionsPerfilPrestadorDeServico(
      Pipe<BlocEventPerfilPrestadorDeServico> blocPipeIn)
      : super(blocPipeIn);

  Future<Uint8List> _converterImagemXFile_Uint8List(XFile pickedFile) async {
    Uint8List _imageData = Uint8List(1);

    _imageData = await pickedFile.readAsBytes();

    return _imageData;
  }

  onChangeName(String novoNome, ViewModelPerfilPrestadorDeServico viewModel) {
    ViewModelPerfilPrestadorDeServico _viewModel =
        ViewModelPerfilPrestadorDeServico(
            prestadorInformation: BusinessModelPrestadorInformation(
      nome: novoNome,
      IdUsuario: viewModel.prestadorInformation.IdUsuario,
      city: viewModel.prestadorInformation.city,
      description: viewModel.prestadorInformation.description,
      phone: viewModel.prestadorInformation.phone,
      roles: viewModel.prestadorInformation.roles,
      workingHours: viewModel.prestadorInformation.workingHours,
    ));

    BlocEventPerfilPrestadorDeServicoAtualizaViewModel blocEvent =
        BlocEventPerfilPrestadorDeServicoAtualizaViewModel(
            viewModel: _viewModel);
    blocPipeIn.send(blocEvent);
  }

  Future<BusinessModelCidade> _getBuisnessModelCidadeByCodCidade(
      String codCidade) async {
    BusinessModelCidade cidade =
        await ProviderCidade().getBusinessModel(codCidade);
    return cidade;
  }

  Future<List<BusinessModelCidade>> getListaCompletaCidades() async {
    List<BusinessModelCidade> listaCompletaDeCidades =
        await ProviderCidade().getBusinessModels();

    return listaCompletaDeCidades;
  }
}
