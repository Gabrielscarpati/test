import 'dart:typed_data';
import 'package:image_picker/image_picker.dart';
import 'package:projeto_treinamento/businessModels/businessModelCidade.dart';
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

  void abrirInterfaceGaleriaCamera(
      ImageSource imageSource,
      ViewModelPerfilPrestadorDeServico viewModel,
      BusinessModelUsuario usuario) async {
    final ImagePicker _picker = ImagePicker();
    final XFile? pickedFile;
    if (ImageSource == ImageSource.camera) {
      pickedFile = await _picker.pickImage(
        source: ImageSource.camera,
        preferredCameraDevice: CameraDevice.front,
      );
    } else {
      pickedFile = await _picker.pickImage(
        source: ImageSource.gallery,
      );
    }
    if (pickedFile != null) {
      Uint8List imagem = await _converterImagemXFile_Uint8List(pickedFile);
      onChangeImagem(imagem, usuario, viewModel);
    }
  }

  Future<Uint8List> _converterImagemXFile_Uint8List(XFile pickedFile) async {
    Uint8List _imageData = Uint8List(1);

    _imageData = await pickedFile.readAsBytes();

    return _imageData;
  }

  onChangeName(String novoNome, ViewModelPerfilPrestadorDeServico viewModel) {
    ViewModelPerfilPrestadorDeServico _viewModel =
        ViewModelPerfilPrestadorDeServico();

    BlocEventPerfilPrestadorDeServicoAtualizaViewModel blocEvent =
        BlocEventPerfilPrestadorDeServicoAtualizaViewModel(
            viewModel: _viewModel);
    blocPipeIn.send(blocEvent);
  }

  onChangeNumber(String novoNome, ViewModelPerfilPrestadorDeServico viewModel) {
    ViewModelPerfilPrestadorDeServico _viewModel =
        ViewModelPerfilPrestadorDeServico();

    BlocEventPerfilPrestadorDeServicoAtualizaViewModel blocEvent =
        BlocEventPerfilPrestadorDeServicoAtualizaViewModel(
            viewModel: _viewModel);
    blocPipeIn.send(blocEvent);
  }

  onChangeEmail(String novoNome, ViewModelPerfilPrestadorDeServico viewModel) {
    ViewModelPerfilPrestadorDeServico _viewModel =
        ViewModelPerfilPrestadorDeServico();

    BlocEventPerfilPrestadorDeServicoAtualizaViewModel blocEvent =
        BlocEventPerfilPrestadorDeServicoAtualizaViewModel(
            viewModel: _viewModel);
    blocPipeIn.send(blocEvent);
  }

  onChangeDescricao(
      String novoNome, ViewModelPerfilPrestadorDeServico viewModel) {
    ViewModelPerfilPrestadorDeServico _viewModel =
        ViewModelPerfilPrestadorDeServico();

    BlocEventPerfilPrestadorDeServicoAtualizaViewModel blocEvent =
        BlocEventPerfilPrestadorDeServicoAtualizaViewModel(
            viewModel: _viewModel);
    blocPipeIn.send(blocEvent);
  }

  onChangeHorasDeTrabalho(
      String novoNome, ViewModelPerfilPrestadorDeServico viewModel) {
    ViewModelPerfilPrestadorDeServico _viewModel =
        ViewModelPerfilPrestadorDeServico();

    BlocEventPerfilPrestadorDeServicoAtualizaViewModel blocEvent =
        BlocEventPerfilPrestadorDeServicoAtualizaViewModel(
            viewModel: _viewModel);
    blocPipeIn.send(blocEvent);
  }

  onChangeServico(
      String novoNome, ViewModelPerfilPrestadorDeServico viewModel) {
    ViewModelPerfilPrestadorDeServico _viewModel =
        ViewModelPerfilPrestadorDeServico();

    BlocEventPerfilPrestadorDeServicoAtualizaViewModel blocEvent =
        BlocEventPerfilPrestadorDeServicoAtualizaViewModel(
            viewModel: _viewModel);
    blocPipeIn.send(blocEvent);
  }

  onChangeCidade(BusinessModelCidade novaCidade,
      ViewModelPerfilPrestadorDeServico viewModel) async {
    ViewModelPerfilPrestadorDeServico _viewModel =
        ViewModelPerfilPrestadorDeServico();
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

  void onChangeImagem(Uint8List imagem, BusinessModelUsuario usuario,
      ViewModelPerfilPrestadorDeServico viewModel) {
    ViewModelPerfilPrestadorDeServico _viewModel =
        ViewModelPerfilPrestadorDeServico();

    BlocEventPerfilPrestadorDeServicoAtualizaViewModel blocEvent =
        BlocEventPerfilPrestadorDeServicoAtualizaViewModel(
            viewModel: _viewModel);
    blocPipeIn.send(blocEvent);

    /* ...inserir imagem no banco de dados... */
  }
}
