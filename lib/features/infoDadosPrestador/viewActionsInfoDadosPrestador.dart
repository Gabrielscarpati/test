import 'dart:typed_data';
import 'package:image_picker/image_picker.dart';
import 'package:projeto_treinamento/businessModels/businessModelCidade.dart';
import 'package:projeto_treinamento/businessModels/businessModelDadosPrestador.dart';
import 'package:projeto_treinamento/features/infoDadosPrestador/viewModelInfoDadosPrestador.dart';
import 'package:projeto_treinamento/features/infoPrestadorDeServico/blocEventInfoPrestadorDeServico.dart';
import 'package:projeto_treinamento/framework/pipe.dart';
import 'package:projeto_treinamento/framework/viewActions.dart';
import 'package:projeto_treinamento/providers/cidade/providerCidade.dart';
import 'blocEventInfoDadosPrestador.dart';

class ViewActionsInfoDadosPrestador extends ViewActions<BlocEventInfoDadosPrestador> {
  ViewActionsInfoDadosPrestador(Pipe<BlocEventInfoDadosPrestador> blocPipeIn) : super(blocPipeIn);


  void abrirInterfaceGaleriaCamera(ImageSource imageSource, ViewModelInfoDadosPrestador viewModel, BusinessModelDadosPrestador DadosPrestador) async {
    final ImagePicker _picker = ImagePicker();
    final XFile? pickedFile;
    /*
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
      onChangeImagem(imagem, DadosPrestador, viewModel);
    }
  }
  */

  Future<Uint8List> _converterImagemXFile_Uint8List(XFile pickedFile) async {
    Uint8List _imageData = Uint8List(1);

    _imageData = await pickedFile.readAsBytes();

    return _imageData;
  }

/*
  onChangeName(String novoNome, ViewModelInfoDadosPrestador viewModel) {
    BusinessModelDadosPrestador DadosPrestador = BusinessModelDadosPrestador(
        name: novoNome,
        email: viewModel.DadosPrestador.email,
        urlFoto: viewModel.DadosPrestador.urlFoto,
        description: viewModel.DadosPrestador.description ,
        phone: viewModel.DadosPrestador.phone,
        brazilianID: viewModel.DadosPrestador.brazilianID,
        brazilianIDpicture: viewModel.DadosPrestador.brazilianIDpicture,
        workingHours: viewModel.DadosPrestador.workingHours,
        roles: viewModel.DadosPrestador.roles,
        city: viewModel.,
    );
    ViewModelInfoDadosPrestador _viewModel = ViewModelInfoDadosPrestador(

        cidade: viewModel.cidade,
        DadosPrestador: DadosPrestador,
        listaCompletaCidade: viewModel.listaCompletaCidade,

    );

    BlocEventInfoDadosPrestadorAtualizaViewModel blocEvent = BlocEventInfoDadosPrestadorAtualizaViewModel(viewModel: _viewModel);
    blocPipeIn.send(blocEvent);
  }
  

  onChangeNumber(String novoNome, ViewModelInfoDadosPrestador viewModel) {
    BusinessModelDadosPrestador DadosPrestador = BusinessModelDadosPrestador(
        nome: novoNome,
        email: viewModel.DadosPrestador.email,
        urlFoto: viewModel.DadosPrestador.urlFoto,
        description: viewModel.DadosPrestador.description ,
        phone: viewModel.DadosPrestador.phone,
        brazilianID: viewModel.DadosPrestador.brazilianID,
        brazilianIDpicture: viewModel.DadosPrestador.brazilianIDpicture,
        workingHours: viewModel.DadosPrestador.workingHours,
        roles: viewModel.DadosPrestador.roles,
        city: viewModel.DadosPrestador.city
    );

    ViewModelInfoDadosPrestador _viewModel = ViewModelInfoDadosPrestador(
      cidade: viewModel.cidade,
      DadosPrestador: DadosPrestador,
      listaCompletaCidade: viewModel.listaCompletaCidade,


    );

    BlocEventInfoDadosPrestadorAtualizaViewModel blocEvent = BlocEventInfoDadosPrestadorAtualizaViewModel(viewModel: _viewModel);
    blocPipeIn.send(blocEvent);
  }

  onChangeEmail(String novoNome, ViewModelInfoDadosPrestador viewModel) {
    BusinessModelDadosPrestador DadosPrestador = BusinessModelDadosPrestador(
        nome: novoNome,
        email: viewModel.DadosPrestador.email,
        urlFoto: viewModel.DadosPrestador.urlFoto,
        description: viewModel.DadosPrestador.description ,
        phone: viewModel.DadosPrestador.phone,
        brazilianID: viewModel.DadosPrestador.brazilianID,
        brazilianIDpicture: viewModel.DadosPrestador.brazilianIDpicture,
        workingHours: viewModel.DadosPrestador.workingHours,
        roles: viewModel.DadosPrestador.roles,
        city: viewModel.DadosPrestador.city
    );
    ViewModelInfoDadosPrestador _viewModel = ViewModelInfoDadosPrestador(
        cidade: viewModel.cidade,
        DadosPrestador: DadosPrestador,
        listaCompletaCidade: viewModel.listaCompletaCidade,
    );

    BlocEventInfoDadosPrestadorAtualizaViewModel blocEvent = BlocEventInfoDadosPrestadorAtualizaViewModel(viewModel: _viewModel);
    blocPipeIn.send(blocEvent);
  }
  onChangeDescricao(String novoNome, ViewModelInfoDadosPrestador viewModel) {
    BusinessModelDadosPrestador DadosPrestador = BusinessModelDadosPrestador(
        nome: novoNome,
        email: viewModel.DadosPrestador.email,
        urlFoto: viewModel.DadosPrestador.urlFoto,
        description: viewModel.DadosPrestador.description ,
        phone: viewModel.DadosPrestador.phone,
        brazilianID: viewModel.DadosPrestador.brazilianID,
        brazilianIDpicture: viewModel.DadosPrestador.brazilianIDpicture,
        workingHours: viewModel.DadosPrestador.workingHours,
        roles: viewModel.DadosPrestador.roles,
        city: viewModel.DadosPrestador.city
     );
    ViewModelInfoDadosPrestador _viewModel = ViewModelInfoDadosPrestador(
        cidade: viewModel.cidade,
        DadosPrestador: DadosPrestador,
        listaCompletaCidade: viewModel.listaCompletaCidade,

    );

    BlocEventInfoDadosPrestadorAtualizaViewModel blocEvent = BlocEventInfoDadosPrestadorAtualizaViewModel(viewModel: _viewModel);
    blocPipeIn.send(blocEvent);
  }  onChangeHorasDeTrabalho(String novoNome, ViewModelInfoDadosPrestador viewModel) {
    BusinessModelDadosPrestador DadosPrestador = BusinessModelDadosPrestador(
        nome: novoNome,
        email: viewModel.DadosPrestador.email,
        urlFoto: viewModel.DadosPrestador.urlFoto,
        description: viewModel.DadosPrestador.description ,
        phone: viewModel.DadosPrestador.phone,
        brazilianID: viewModel.DadosPrestador.brazilianID,
        brazilianIDpicture: viewModel.DadosPrestador.brazilianIDpicture,
        workingHours: viewModel.DadosPrestador.workingHours,
        roles: viewModel.DadosPrestador.roles,
        city: viewModel.DadosPrestador.city    );

    ViewModelInfoDadosPrestador _viewModel = ViewModelInfoDadosPrestador(
        cidade: viewModel.cidade,
        DadosPrestador: DadosPrestador,
        listaCompletaCidade: viewModel.listaCompletaCidade,

    );

    BlocEventInfoDadosPrestadorAtualizaViewModel blocEvent = BlocEventInfoDadosPrestadorAtualizaViewModel(viewModel: _viewModel);
    blocPipeIn.send(blocEvent);
  }  onChangeServico(String novoNome, ViewModelInfoDadosPrestador viewModel) {
    BusinessModelDadosPrestador DadosPrestador = BusinessModelDadosPrestador(
        nome: novoNome,
        email: viewModel.DadosPrestador.email,
        urlFoto: viewModel.DadosPrestador.urlFoto,
        description: viewModel.DadosPrestador.description ,
        phone: viewModel.DadosPrestador.phone,
        brazilianID: viewModel.DadosPrestador.brazilianID,
        brazilianIDpicture: viewModel.DadosPrestador.brazilianIDpicture,
        workingHours: viewModel.DadosPrestador.workingHours,
        roles: viewModel.DadosPrestador.roles,
        city: viewModel.DadosPrestador.city    );
    ViewModelInfoDadosPrestador _viewModel = ViewModelInfoDadosPrestador(

        cidade: viewModel.cidade,
        DadosPrestador: DadosPrestador,
        listaCompletaCidade: viewModel.listaCompletaCidade,

    );

    BlocEventInfoDadosPrestadorAtualizaViewModel blocEvent = BlocEventInfoDadosPrestadorAtualizaViewModel(viewModel: _viewModel);
    blocPipeIn.send(blocEvent);
  }

  onChangeCidade(BusinessModelCidade novaCidade, ViewModelInfoDadosPrestador viewModel) async {
    ViewModelInfoDadosPrestador _viewModel = ViewModelInfoDadosPrestador(
        cidade: viewModel.cidade,
        listaCompletaCidade: viewModel.listaCompletaCidade,
        DadosPrestador: viewModel.DadosPrestador,
    );
    BlocEventInfoDadosPrestadorAtualizaViewModel blocEvent = BlocEventInfoDadosPrestadorAtualizaViewModel(viewModel: _viewModel);
    blocPipeIn.send(blocEvent);
  }

  Future<BusinessModelCidade> _getBuisnessModelCidadeByCodCidade(String codCidade) async {
    BusinessModelCidade cidade = await ProviderCidade().getBusinessModel(codCidade);
    return cidade;
  }
  */

  Future<List<BusinessModelCidade>> getListaCompletaCidades() async {
    List<BusinessModelCidade> listaCompletaDeCidades = await ProviderCidade().getBusinessModels();

    return listaCompletaDeCidades;
  }
}
}