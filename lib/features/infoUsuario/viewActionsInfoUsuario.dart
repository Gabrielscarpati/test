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
    BusinessModelUsuario usuario = BusinessModelUsuario(
        nome: novoNome,
        email: viewModel.usuario.email,
        urlFoto: viewModel.usuario.urlFoto,
        description: viewModel.usuario.description ,
        phone: viewModel.usuario.phone,
        brazilianID: viewModel.usuario.brazilianID,
        brazilianIDpicture: viewModel.usuario.brazilianIDpicture,
        workingHours: viewModel.usuario.workingHours,
        roles: viewModel.usuario.roles,
        city: viewModel.usuario.city
    );
    ViewModelInfoUsuario _viewModel = ViewModelInfoUsuario(

        cidade: viewModel.cidade,
        usuario: usuario,
        listaCompletaCidade: viewModel.listaCompletaCidade,

    );

    BlocEventInfoUsuarioAtualizaViewModel blocEvent = BlocEventInfoUsuarioAtualizaViewModel(viewModel: _viewModel);
    blocPipeIn.send(blocEvent);
  }

  onChangeNumber(String novoNome, ViewModelInfoUsuario viewModel) {
    BusinessModelUsuario usuario = BusinessModelUsuario(
        nome: novoNome,
        email: viewModel.usuario.email,
        urlFoto: viewModel.usuario.urlFoto,
        description: viewModel.usuario.description ,
        phone: viewModel.usuario.phone,
        brazilianID: viewModel.usuario.brazilianID,
        brazilianIDpicture: viewModel.usuario.brazilianIDpicture,
        workingHours: viewModel.usuario.workingHours,
        roles: viewModel.usuario.roles,
        city: viewModel.usuario.city
    );

    ViewModelInfoUsuario _viewModel = ViewModelInfoUsuario(
      cidade: viewModel.cidade,
      usuario: usuario,
      listaCompletaCidade: viewModel.listaCompletaCidade,


    );

    BlocEventInfoUsuarioAtualizaViewModel blocEvent = BlocEventInfoUsuarioAtualizaViewModel(viewModel: _viewModel);
    blocPipeIn.send(blocEvent);
  }

  onChangeEmail(String novoNome, ViewModelInfoUsuario viewModel) {
    BusinessModelUsuario usuario = BusinessModelUsuario(
        nome: novoNome,
        email: viewModel.usuario.email,
        urlFoto: viewModel.usuario.urlFoto,
        description: viewModel.usuario.description ,
        phone: viewModel.usuario.phone,
        brazilianID: viewModel.usuario.brazilianID,
        brazilianIDpicture: viewModel.usuario.brazilianIDpicture,
        workingHours: viewModel.usuario.workingHours,
        roles: viewModel.usuario.roles,
        city: viewModel.usuario.city
    );
    ViewModelInfoUsuario _viewModel = ViewModelInfoUsuario(
        cidade: viewModel.cidade,
        usuario: usuario,
        listaCompletaCidade: viewModel.listaCompletaCidade,
    );

    BlocEventInfoUsuarioAtualizaViewModel blocEvent = BlocEventInfoUsuarioAtualizaViewModel(viewModel: _viewModel);
    blocPipeIn.send(blocEvent);
  }
  onChangeDescricao(String novoNome, ViewModelInfoUsuario viewModel) {
    BusinessModelUsuario usuario = BusinessModelUsuario(
        nome: novoNome,
        email: viewModel.usuario.email,
        urlFoto: viewModel.usuario.urlFoto,
        description: viewModel.usuario.description ,
        phone: viewModel.usuario.phone,
        brazilianID: viewModel.usuario.brazilianID,
        brazilianIDpicture: viewModel.usuario.brazilianIDpicture,
        workingHours: viewModel.usuario.workingHours,
        roles: viewModel.usuario.roles,
        city: viewModel.usuario.city
     );
    ViewModelInfoUsuario _viewModel = ViewModelInfoUsuario(
        cidade: viewModel.cidade,
        usuario: usuario,
        listaCompletaCidade: viewModel.listaCompletaCidade,

    );

    BlocEventInfoUsuarioAtualizaViewModel blocEvent = BlocEventInfoUsuarioAtualizaViewModel(viewModel: _viewModel);
    blocPipeIn.send(blocEvent);
  }  onChangeHorasDeTrabalho(String novoNome, ViewModelInfoUsuario viewModel) {
    BusinessModelUsuario usuario = BusinessModelUsuario(
        nome: novoNome,
        email: viewModel.usuario.email,
        urlFoto: viewModel.usuario.urlFoto,
        description: viewModel.usuario.description ,
        phone: viewModel.usuario.phone,
        brazilianID: viewModel.usuario.brazilianID,
        brazilianIDpicture: viewModel.usuario.brazilianIDpicture,
        workingHours: viewModel.usuario.workingHours,
        roles: viewModel.usuario.roles,
        city: viewModel.usuario.city    );

    ViewModelInfoUsuario _viewModel = ViewModelInfoUsuario(
        cidade: viewModel.cidade,
        usuario: usuario,
        listaCompletaCidade: viewModel.listaCompletaCidade,

    );

    BlocEventInfoUsuarioAtualizaViewModel blocEvent = BlocEventInfoUsuarioAtualizaViewModel(viewModel: _viewModel);
    blocPipeIn.send(blocEvent);
  }  onChangeServico(String novoNome, ViewModelInfoUsuario viewModel) {
    BusinessModelUsuario usuario = BusinessModelUsuario(
        nome: novoNome,
        email: viewModel.usuario.email,
        urlFoto: viewModel.usuario.urlFoto,
        description: viewModel.usuario.description ,
        phone: viewModel.usuario.phone,
        brazilianID: viewModel.usuario.brazilianID,
        brazilianIDpicture: viewModel.usuario.brazilianIDpicture,
        workingHours: viewModel.usuario.workingHours,
        roles: viewModel.usuario.roles,
        city: viewModel.usuario.city    );
    ViewModelInfoUsuario _viewModel = ViewModelInfoUsuario(

        cidade: viewModel.cidade,
        usuario: usuario,
        listaCompletaCidade: viewModel.listaCompletaCidade,

    );

    BlocEventInfoUsuarioAtualizaViewModel blocEvent = BlocEventInfoUsuarioAtualizaViewModel(viewModel: _viewModel);
    blocPipeIn.send(blocEvent);
  }

  onChangeCidade(BusinessModelCidade novaCidade, ViewModelInfoUsuario viewModel) async {
    ViewModelInfoUsuario _viewModel = ViewModelInfoUsuario(
        cidade: viewModel.cidade,
        listaCompletaCidade: viewModel.listaCompletaCidade,
        usuario: viewModel.usuario,
    );
    BlocEventInfoUsuarioAtualizaViewModel blocEvent = BlocEventInfoUsuarioAtualizaViewModel(viewModel: _viewModel);
    blocPipeIn.send(blocEvent);
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
    ViewModelInfoUsuario _viewModel = ViewModelInfoUsuario(
        cidade: viewModel.cidade,
        usuario: usuario,
        listaCompletaCidade: viewModel.listaCompletaCidade,

    );

    BlocEventInfoUsuarioAtualizaViewModel blocEvent = BlocEventInfoUsuarioAtualizaViewModel(viewModel: _viewModel);
    blocPipeIn.send(blocEvent);

    /* ...inserir imagem no banco de dados... */
  }


}
