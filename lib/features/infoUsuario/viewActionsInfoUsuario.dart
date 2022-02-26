import 'dart:typed_data';

import 'package:image_picker/image_picker.dart';
import 'package:projeto_treinamento/businessModels/businessModelCidade.dart';
import 'package:projeto_treinamento/businessModels/businessModelUsuario.dart';
import 'package:projeto_treinamento/features/infoUsuario/viewModelInfoUsuario.dart';
import 'package:projeto_treinamento/framework/pipe.dart';
import 'package:projeto_treinamento/framework/viewActions.dart';
import 'package:projeto_treinamento/providers/cidade/providerCidade.dart';

import 'blocEventInfoUsuario.dart';

class ViewActionsInfoUsuario extends ViewActions<BlocEventInfoUsuario> {
  ViewActionsInfoUsuario(Pipe<BlocEventInfoUsuario> blocPipeIn) : super(blocPipeIn);

  void abrirInterfaceGaleriaCamera(ImageSource imageSource, ViewModelInfoUsuario viewModel, BusinessModelUsuario usuario) async {
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

  onChangeName(String novoNome, ViewModelInfoUsuario viewModel) {
    BusinessModelUsuario usuario = BusinessModelUsuario(nome: novoNome, email: viewModel.usuario.email, urlFoto: viewModel.usuario.urlFoto);
    ViewModelInfoUsuario _viewModel = ViewModelInfoUsuario(cidade: viewModel.cidade, usuario: usuario, listaCompletaCidade: viewModel.listaCompletaCidade);

    BlocEventInfoUsuarioAtualizaViewModel blocEvent = BlocEventInfoUsuarioAtualizaViewModel(viewModel: _viewModel);
    blocPipeIn.send(blocEvent);
    //algo para salvar novo usuario
  }

  onChangeCidade(BusinessModelCidade novaCidade, ViewModelInfoUsuario viewModel) async {
    ViewModelInfoUsuario _viewModel = ViewModelInfoUsuario(cidade: novaCidade, usuario: viewModel.usuario, listaCompletaCidade: viewModel.listaCompletaCidade);
    BlocEventInfoUsuarioAtualizaViewModel blocEvent = BlocEventInfoUsuarioAtualizaViewModel(viewModel: _viewModel);
    blocPipeIn.send(blocEvent);
    //algo para salvar novo usuario
  }

  Future<BusinessModelCidade> _getBuisnessModelCidadeByCodCidade(String codCidade) async {
    BusinessModelCidade cidade = await ProviderCidade().getBusinessModel(codCidade);
    return cidade;
  }

  Future<List<BusinessModelCidade>> getListaCompletaCidades() async {
    List<BusinessModelCidade> listaCompletaDeCidades = await ProviderCidade().getBusinessModels();

    return listaCompletaDeCidades;
  }

  void onChangeImagem(Uint8List imagem, BusinessModelUsuario usuario, ViewModelInfoUsuario viewModel) {
    ViewModelInfoUsuario _viewModel = ViewModelInfoUsuario(cidade: viewModel.cidade, usuario: usuario, listaCompletaCidade: viewModel.listaCompletaCidade, imagemAtualizada: imagem);

    BlocEventInfoUsuarioAtualizaViewModel blocEvent = BlocEventInfoUsuarioAtualizaViewModel(viewModel: _viewModel);
    blocPipeIn.send(blocEvent);

    /* ...inserir imagem no banco de dados... */
  }
}
