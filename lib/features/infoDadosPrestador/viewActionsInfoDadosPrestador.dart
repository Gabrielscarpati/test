import 'dart:typed_data';
import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';
import 'package:projeto_treinamento/businessModels/businessModelCidade.dart';
import 'package:projeto_treinamento/businessModels/businessModelDadosPrestador.dart';
import 'package:projeto_treinamento/features/infoDadosPrestador/viewModelInfoDadosPrestador.dart';
import 'package:projeto_treinamento/features/infoPrestadorDeServico/blocEventInfoPrestadorDeServico.dart';
import 'package:projeto_treinamento/framework/pipe.dart';
import 'package:projeto_treinamento/framework/viewActions.dart';
import 'package:projeto_treinamento/providers/cidade/providerCidade.dart';
import '../../util/prestador.dart';
import 'blocEventInfoDadosPrestador.dart';

class ViewActionsInfoDadosPrestador
    extends ViewActions<BlocEventInfoDadosPrestador> {
  ViewActionsInfoDadosPrestador(Pipe<BlocEventInfoDadosPrestador> blocPipeIn)
      : super(blocPipeIn);

  void abrirInterfaceGaleriaCamera(
      ImageSource imageSource,
      ViewModelInfoDadosPrestador viewModel,
      BusinessModelDadosPrestador DadosPrestador) async {
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
  
  */
  }

  Future<Uint8List> _converterImagemXFile_Uint8List(XFile pickedFile) async {
    Uint8List _imageData = Uint8List(1);

    _imageData = await pickedFile.readAsBytes();

    return _imageData;
  }

  onChangeName(String novoNome, ViewModelInfoDadosPrestador viewModel) {
    BusinessModelDadosPrestador DadosPrestador = BusinessModelDadosPrestador(
      name: novoNome,
      IdPrestador: viewModel.prestador.IdPrestador,
      city: viewModel.prestador.city,
      dataAberturaConta: viewModel.prestador.dataAberturaConta,
      dataVencimentoPlano: viewModel.prestador.dataVencimentoPlano,
      description: viewModel.prestador.description,
      numeroDeCliquesNoLigarOuWhatsApp:
          viewModel.prestador.numeroDeCliquesNoLigarOuWhatsApp,
      phone: viewModel.prestador.phone,
      profilePicture: viewModel.prestador.profilePicture,
      roles: viewModel.prestador.roles,
      workingHours: viewModel.prestador.workingHours,
      tipoPlanoPrestador: viewModel.prestador.tipoPlanoPrestador,
    );
    ViewModelInfoDadosPrestador _viewModel = ViewModelInfoDadosPrestador(
      cidades: viewModel.cidades,
      prestador: DadosPrestador,
      imagemAtualizada: viewModel.imagemAtualizada,
      listaCompletaCidade: viewModel.listaCompletaCidade,
    );

    BlocEventInfoDadosPrestadorAtualizaViewModel blocEvent =
        BlocEventInfoDadosPrestadorAtualizaViewModel(viewModel: _viewModel);
    blocPipeIn.send(blocEvent);
  }

  onChangeNumber(String telefone, ViewModelInfoDadosPrestador viewModel) {
    BusinessModelDadosPrestador DadosPrestador = BusinessModelDadosPrestador(
      name: viewModel.prestador.name,
      IdPrestador: viewModel.prestador.IdPrestador,
      city: viewModel.prestador.city,
      dataAberturaConta: viewModel.prestador.dataAberturaConta,
      dataVencimentoPlano: viewModel.prestador.dataVencimentoPlano,
      description: viewModel.prestador.description,
      numeroDeCliquesNoLigarOuWhatsApp:
          viewModel.prestador.numeroDeCliquesNoLigarOuWhatsApp,
      phone: telefone,
      profilePicture: viewModel.prestador.profilePicture,
      roles: viewModel.prestador.roles,
      workingHours: viewModel.prestador.workingHours,
      tipoPlanoPrestador: viewModel.prestador.tipoPlanoPrestador,
    );
    ViewModelInfoDadosPrestador _viewModel = ViewModelInfoDadosPrestador(
      cidades: viewModel.cidades,
      prestador: DadosPrestador,
      imagemAtualizada: viewModel.imagemAtualizada,
      listaCompletaCidade: viewModel.listaCompletaCidade,
    );

    BlocEventInfoDadosPrestadorAtualizaViewModel blocEvent =
        BlocEventInfoDadosPrestadorAtualizaViewModel(viewModel: _viewModel);
    blocPipeIn.send(blocEvent);
  }

  onChangeHoras(String novaHora, ViewModelInfoDadosPrestador viewModel) {
    BusinessModelDadosPrestador DadosPrestador = BusinessModelDadosPrestador(
      name: viewModel.prestador.name,
      IdPrestador: viewModel.prestador.IdPrestador,
      city: viewModel.prestador.city,
      dataAberturaConta: viewModel.prestador.dataAberturaConta,
      dataVencimentoPlano: viewModel.prestador.dataVencimentoPlano,
      description: viewModel.prestador.description,
      numeroDeCliquesNoLigarOuWhatsApp:
          viewModel.prestador.numeroDeCliquesNoLigarOuWhatsApp,
      phone: viewModel.prestador.phone,
      profilePicture: viewModel.prestador.profilePicture,
      roles: viewModel.prestador.roles,
      workingHours: novaHora,
      tipoPlanoPrestador: viewModel.prestador.tipoPlanoPrestador,
    );
    ViewModelInfoDadosPrestador _viewModel = ViewModelInfoDadosPrestador(
      cidades: viewModel.cidades,
      prestador: DadosPrestador,
      imagemAtualizada: viewModel.imagemAtualizada,
      listaCompletaCidade: viewModel.listaCompletaCidade,
    );

    BlocEventInfoDadosPrestadorAtualizaViewModel blocEvent =
        BlocEventInfoDadosPrestadorAtualizaViewModel(viewModel: _viewModel);
    blocPipeIn.send(blocEvent);
  }

  onChangeDescricao(
      String novaDescricao, ViewModelInfoDadosPrestador viewModel) {
    BusinessModelDadosPrestador DadosPrestador = BusinessModelDadosPrestador(
      name: viewModel.prestador.name,
      IdPrestador: viewModel.prestador.IdPrestador,
      city: viewModel.prestador.city,
      dataAberturaConta: viewModel.prestador.dataAberturaConta,
      dataVencimentoPlano: viewModel.prestador.dataVencimentoPlano,
      description: novaDescricao,
      numeroDeCliquesNoLigarOuWhatsApp:
          viewModel.prestador.numeroDeCliquesNoLigarOuWhatsApp,
      phone: viewModel.prestador.phone,
      profilePicture: viewModel.prestador.profilePicture,
      roles: viewModel.prestador.roles,
      workingHours: viewModel.prestador.workingHours,
      tipoPlanoPrestador: viewModel.prestador.tipoPlanoPrestador,
    );
    ViewModelInfoDadosPrestador _viewModel = ViewModelInfoDadosPrestador(
      cidades: viewModel.cidades,
      prestador: DadosPrestador,
      imagemAtualizada: viewModel.imagemAtualizada,
      listaCompletaCidade: viewModel.listaCompletaCidade,
    );

    BlocEventInfoDadosPrestadorAtualizaViewModel blocEvent =
        BlocEventInfoDadosPrestadorAtualizaViewModel(viewModel: _viewModel);
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

  void salvarDadosPrestador(
      ViewModelInfoDadosPrestador viewModel, BuildContext context) async {
    await Prestador().getPrestadores();
    Navigator.of(context).pop(viewModel.prestador);
  }
}
