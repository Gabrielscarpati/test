import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:projeto_treinamento/businessModels/businessModelAvaliacaoPrestadorDeServico.dart';
import 'package:projeto_treinamento/businessModels/businessModelCidade.dart';
import 'package:projeto_treinamento/businessModels/businessModelPrestadorDeServicos.dart';
import 'package:projeto_treinamento/businessModels/businessModelPrestadoresDeServicoPorCidadeTipoDeServico.dart';
import 'package:projeto_treinamento/businessModels/businessModelPrincipaisTiposDeServicoCidade.dart';
import 'package:projeto_treinamento/businessModels/businessModelTiposDeServico.dart';
import 'package:projeto_treinamento/framework/bloc.dart';
import 'package:projeto_treinamento/framework/viewModel.dart';
import 'package:projeto_treinamento/providers/cidade/providerCidade.dart';
import 'package:projeto_treinamento/providers/prestadoresDeServicoPorCidadeTipoDeServico/providerPrestadoresDeServicoPorCidadeTipoDeServico.dart';
import 'package:projeto_treinamento/providers/principaisTiposDeServicoCidade/providerPrincipaisTiposDeServicoCidade.dart';
import 'package:projeto_treinamento/util/cidade.dart';
import 'package:projeto_treinamento/util/getAvaliacoesPrestador.dart';
import 'package:projeto_treinamento/util/getCodigoCidade.dart';
import 'package:projeto_treinamento/util/prestador.dart';
import 'package:projeto_treinamento/util/tipoDeServico.dart';

import '../../businessModels/businessModelDadosPrestador.dart';
import 'blocEventHub.dart';
import 'viewModelHub.dart';

class BlocHub extends Bloc<ViewModelHubPrestador, BlocEventHubPrestador> {
  @override
  void onReceiveBlocEvent(BlocEventHubPrestador blocEvent) {
    if (blocEvent is BlocEventHubInicializaViewModelPrestador)
      _inicializaViewModel(blocEvent);
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
    BusinessModelDadosPrestador prestador =
        await Prestador().getPrestadorLogado();
    ;
    print(prestador);
    int newcodCidade =
        await GetCodCidade(nomeCidade: prestador.city[0]).action();
    BusinessModelPrestadoresDeServicoPorCidadeTipoDeServico
        businessModelPrestadoresDeServicoPorCidadeTipoDeServico =
        await ProviderPrestadoresDeServicoPorCidadeTipoDeServico() //business model null
            .getBusinessModel(
                newcodCidade.toString() + "-" + prestador.roles[0].toString());

    print(businessModelPrestadoresDeServicoPorCidadeTipoDeServico);

    BusinessModelPrestadorDeServicos prestadorLogado =
        BusinessModelPrestadorDeServicos(
            codPrestadorServico: "0",
            description: "",
            nome: "Prestador",
            nota: 5,
            statusOnline: true,
            telefone: "1234567",
            tipoPlanoPrestador: 0,
            totalDeAvaliacoes: 1,
            totalDeAvaliacoesNota1: 0,
            totalDeAvaliacoesNota2: 0,
            totalDeAvaliacoesNota3: 0,
            totalDeAvaliacoesNota4: 0,
            totalDeAvaliacoesNota5: 1,
            urlFoto: "",
            cidades: [],
            servicos: [],
            workingHours: '');

    businessModelPrestadoresDeServicoPorCidadeTipoDeServico.prestadoresDeServico
        .forEach((element) {
      if (element.codPrestadorServico == prestador.IdPrestador) {
        prestadorLogado = element;
      }
    });

    String idCidadeDoprestador = "1"; // 1=colatina

    List<BusinessModelCidade> cidades = Cidades().listaDeTodasAsCidades;
    List<BusinessModelCidade> _cidades = [];

    cidades.forEach((element) {
      if (prestador.city.contains(element.nome)) {
        _cidades.add(element);
      }
    });

    List<BusinessModelTiposDeServico> tiposServico =
        TipoDeServico().listaTodosPrestadores;
    List<BusinessModelTiposDeServico> _tiposServico = [];

    tiposServico.forEach((element) {
      if (prestador.roles.contains(element.codTipoServico)) {
        _tiposServico.add(element);
      }
    });

    List<BusinessModelAvaliacaoPrestadorDeServico>
        listaAvaliacoesPrestadorDeServico =
        (await GetAvaliacoesPrestador().action(prestador.IdPrestador))
            .cast<BusinessModelAvaliacaoPrestadorDeServico>();

    ViewModelHubPrestador viewModel = ViewModelHubPrestador(
      prestadorDeServicos: prestadorLogado,
      cidade: _cidades,
      listaAvaliacoesPrestadorDeServico: listaAvaliacoesPrestadorDeServico,
      prestador: prestador,
      tiposDeServico: _tiposServico,
    );
    this.sendViewModelOut(viewModel);
  }


  void _atualizaViewModel(
      BlocEventHubPrestadorAtualizaViewModel blocEvent) async {
    BlocEventHubInicializaViewModelPrestador blocEvet = BlocEventHubInicializaViewModelPrestador(viewModel: blocEvent.viewModel);
    await Prestador().getPrestadores();
    _inicializaViewModel(blocEvet);
  }
}
