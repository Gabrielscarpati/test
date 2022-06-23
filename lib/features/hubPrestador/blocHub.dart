import 'package:flutter/cupertino.dart';
import 'package:projeto_treinamento/businessModels/businessModelCidade.dart';
import 'package:projeto_treinamento/businessModels/businessModelPrincipaisTiposDeServicoCidade.dart';
import 'package:projeto_treinamento/framework/bloc.dart';
import 'package:projeto_treinamento/framework/viewModel.dart';
import 'package:projeto_treinamento/providers/cidade/providerCidade.dart';
import 'package:projeto_treinamento/providers/principaisTiposDeServicoCidade/providerPrincipaisTiposDeServicoCidade.dart';

import '../../businessModels/businessModelDadosPrestador.dart';
import 'blocEventHub.dart';
import 'viewModelHub.dart';

class BlocHub extends Bloc<ViewModelHubPrestador, BlocEventHubPrestador> {
  @override
  void onReceiveBlocEvent(BlocEventHubPrestador blocEvent) {
    if (blocEvent is BlocEventHubInicializaViewModelPrestador)
      _inicializaViewModel(blocEvent);
    if (blocEvent is BlocEventHubSelecionaCidade) _selecionaCidade(blocEvent);
    if (blocEvent is BlocEventHubPrestadorAtualizaViewModel)
      _atualizaViewModel(blocEvent);
  }


/*  Future<ViewModelHubPrestador> _aplicaCidadeNoViewModel(BusinessModelDadosPrestador prestador, String idCidade) async {
    BusinessModelPrincipaisTiposDeServicoCidade principaisTiposDeServicoCidade = await ProviderPrincipaisTiposDeServicoCidade().getBusinessModel(idCidade);
    print(principaisTiposDeServicoCidade);

    ViewModelHubPrestador viewModel = ViewModelHubPrestador(
      prestador: prestador,
      cidade: principaisTiposDeServicoCidade.cidade,
      principaisTiposDeServicoCidade: principaisTiposDeServicoCidade,
    );
    return viewModel;
  }*/

  void _inicializaViewModel(
      BlocEventHubInicializaViewModelPrestador blocEvent) async {
    BusinessModelDadosPrestador prestador = BusinessModelDadosPrestador(
        name: 'name',
        phone: 'phone',
        workingHours: 'workingHours',
        description: 'description',
        profilePicture: 'profilePicture',
        city: ['city'],
        roles: [1,2],
        numeroDeCliquesNoLigarOuWhatsApp: 0,
        dataVencimentoPlano: DateTime.now(),
        dataAberturaConta:  DateTime.now(),
        IdPrestador: 'IdPrestador',
        tipoPlanoPrestador: 10);

    String idCidadeDoprestador = "1"; // 1=colatina

    List<BusinessModelCidade> cidades =
        await ProviderCidade().getBusinessModels();

    BusinessModelPrincipaisTiposDeServicoCidade
        principaisTiposDeServicoCidades =
        await ProviderPrincipaisTiposDeServicoCidade()
            .getBusinessModel(cidades[0].id);

    ViewModelHubPrestador viewModelTmp = ViewModelHubPrestador(
      prestador: prestador,
      cidade: cidades[0],
      principaisTiposDeServicoCidade: principaisTiposDeServicoCidades,
    );
    this.sendViewModelOut(viewModelTmp);

    ViewModelHubPrestador viewModel =
        await _aplicaCidadeNoViewModel(prestador, idCidadeDoprestador);
    this.sendViewModelOut(viewModel);
  }

  void _selecionaCidade(BlocEventHubSelecionaCidade blocEvent) async {
    ViewModelHubPrestador viewModel = await _aplicaCidadeNoViewModel(
      blocEvent.viewModel.prestador,
      blocEvent.codCidade.toString(),
    );
    this.sendViewModelOut(viewModel);
  }

  Future<ViewModelHubPrestador> _aplicaCidadeNoViewModel(
      BusinessModelDadosPrestador prestador, String idCidade) async {
    BusinessModelPrincipaisTiposDeServicoCidade principaisTiposDeServicoCidade =
        await ProviderPrincipaisTiposDeServicoCidade()
            .getBusinessModel(idCidade);
    print(principaisTiposDeServicoCidade);
    ViewModelHubPrestador viewModel = ViewModelHubPrestador(
      prestador: prestador,
      cidade: principaisTiposDeServicoCidade.cidade,
      principaisTiposDeServicoCidade: principaisTiposDeServicoCidade,
    );
    return viewModel;
  }

  void _atualizaViewModel(
      BlocEventHubPrestadorAtualizaViewModel blocEvent) async {
    BusinessModelDadosPrestador prestadorTemp = BusinessModelDadosPrestador(
      dataAberturaConta: blocEvent.viewModel.prestador.dataAberturaConta,
      numeroDeCliquesNoLigarOuWhatsApp:
          blocEvent.viewModel.prestador.numeroDeCliquesNoLigarOuWhatsApp,
      profilePicture: blocEvent.viewModel.prestador.profilePicture,
      dataVencimentoPlano: blocEvent.viewModel.prestador.dataVencimentoPlano,
      IdPrestador: blocEvent.viewModel.prestador.IdPrestador,
      name: blocEvent.viewModel.prestador.name,
      phone: blocEvent.viewModel.prestador.phone,
      city: blocEvent.viewModel.prestador.city,
      description: blocEvent.viewModel.prestador.description,
      roles: blocEvent.viewModel.prestador.roles,
      workingHours: blocEvent.viewModel.prestador.workingHours,
      tipoPlanoPrestador: blocEvent.viewModel.prestador.tipoPlanoPrestador,
    );

    ViewModelHubPrestador viewModelTmp = ViewModelHubPrestador(
      prestador: prestadorTemp,
      cidade: BusinessModelCidade.vazio(),
      principaisTiposDeServicoCidade:
          BusinessModelPrincipaisTiposDeServicoCidade.vazio(),
    );
    this.sendViewModelOut(viewModelTmp);

    //String urlFoto = await Providerprestador().getUrlFotoById(prestador.id);

    BusinessModelDadosPrestador prestador = BusinessModelDadosPrestador(
      profilePicture: blocEvent.viewModel.prestador.profilePicture,
      IdPrestador: blocEvent.viewModel.prestador.IdPrestador,
      dataAberturaConta: blocEvent.viewModel.prestador.dataAberturaConta,
      dataVencimentoPlano: blocEvent.viewModel.prestador.dataVencimentoPlano,
      name: blocEvent.viewModel.prestador.name,
      numeroDeCliquesNoLigarOuWhatsApp:
          blocEvent.viewModel.prestador.numeroDeCliquesNoLigarOuWhatsApp,
      phone: blocEvent.viewModel.prestador.phone,
      city: blocEvent.viewModel.prestador.city,
      description: blocEvent.viewModel.prestador.description,
      roles: blocEvent.viewModel.prestador.roles,
      workingHours: blocEvent.viewModel.prestador.workingHours,
      tipoPlanoPrestador: blocEvent.viewModel.prestador.tipoPlanoPrestador,
    );
    debugPrint(blocEvent.viewModel.cidade.id);

    ViewModelHubPrestador _viewModel = await _aplicaCidadeNoViewModel(
        prestador, blocEvent.viewModel.cidade.id);

    ViewModelHubPrestador viewModel = ViewModelHubPrestador(
        prestador: prestador,
        cidade: _viewModel.cidade,
        principaisTiposDeServicoCidade:
            _viewModel.principaisTiposDeServicoCidade);
    this.sendViewModelOut(viewModel);
  }
}
