import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:projeto_treinamento/businessModels/businessModelCidade.dart';
import 'package:projeto_treinamento/businessModels/businessModelDadosPrestador.dart';
import 'package:projeto_treinamento/businessModels/businessModelPrestadorDeServicoxCidade.dart';
import 'package:projeto_treinamento/businessModels/businessModelPrincipaisTiposDeServicoCidade.dart';
import 'package:projeto_treinamento/businessModels/businessModelTiposDeServico.dart';
import 'package:projeto_treinamento/daos/principaisTiposDeServicoCidade/daoPrincipaisTiposDeServicoCidade.dart';
import 'package:projeto_treinamento/daos/tiposDeServico/dataModelBuilderTipoDeServico.dart';
import 'package:projeto_treinamento/daos/tiposDeServico/dataModelTipoDeServico.dart';
import 'package:projeto_treinamento/framework/provider.dart';
import 'package:projeto_treinamento/framework/providerDireto.dart';
import 'package:projeto_treinamento/providers/cidade/providerCidade.dart';
import 'package:projeto_treinamento/providers/dadosPrestador/providerDadosPrestador.dart';
import 'package:projeto_treinamento/providers/tiposDeServico/providerTiposDeServico.dart';
import 'package:projeto_treinamento/util/resposta_processamento.dart';

import '../../util/getQtdePrestadoresDeServicoPorTipoSeervicoECidade.dart';

class ProviderPrincipaisTiposDeServicoCidade
    extends Provider<BusinessModelPrincipaisTiposDeServicoCidade> {
  @override
  Future<BusinessModelPrincipaisTiposDeServicoCidade> getBusinessModel(
      String id) async {
    BusinessModelPrincipaisTiposDeServicoCidade
        businessModelPrincipaisTiposDeServicoCidade;

    List<BusinessModelCidade> cidades =
        await ProviderCidade().getBusinessModels();
    List<BusinessModelDadosPrestador> prestadores =
        await ProvideDadosPrestador().getBusinessModels();

    List<BusinessModelDadosPrestador> prestadoresFiltrados = [];
    print(cidades[int.parse(id)]);
    prestadoresFiltrados = prestadores
        .where((element) => element.city == cidades[int.parse(id)].nome)
        .toList();

    print(prestadores);

    if (prestadoresFiltrados.length < 4) {
      prestadoresFiltrados = prestadores;
    }

    List<BusinessModelTiposDeServico> listBusinessModelTipoDeServico = [];
    prestadoresFiltrados.forEach((element) {
      BusinessModelTiposDeServico tiposDeServico;
      element.roles.forEach((element) async {
        print(element);
        tiposDeServico =
            await ProviderTiposDeServico().getBusinessModel(element.toString());
        print(tiposDeServico);
        listBusinessModelTipoDeServico.add(tiposDeServico);
      });
    });

    List<BusinessModelTiposDeServico> listPrincipaisBusinessModelTipoDeServico =
        [];
    Map mapQuantidadeServicoUmaCidade = {};

    for (int i = 0; i < listBusinessModelTipoDeServico.length; i++) {
      if (mapQuantidadeServicoUmaCidade
          .containsKey(listBusinessModelTipoDeServico[i].codTipoServico)) {
        mapQuantidadeServicoUmaCidade[listBusinessModelTipoDeServico[i]
            .codTipoServico] = mapQuantidadeServicoUmaCidade[
                listBusinessModelTipoDeServico[i].codTipoServico] +
            1;
      } else {
        mapQuantidadeServicoUmaCidade[
            listBusinessModelTipoDeServico[i].codTipoServico] = 1;
      }
    }

    print(mapQuantidadeServicoUmaCidade);

    List<int> listaQuantidadePrestadores = [];
    List<String> listKeys = [];

    mapQuantidadeServicoUmaCidade.forEach((key, value) {
      listaQuantidadePrestadores.add(value);
      listBusinessModelTipoDeServico.add(key);
    });

    List<int> listaindexMaiorValor = [];
    for (int i = 0; i < listaQuantidadePrestadores.length; i++) {
      int indexMaiorValor = i;
      for (int j = 0; j < listaQuantidadePrestadores.length; j++) {
        if (listaQuantidadePrestadores[j] >
            listaQuantidadePrestadores[indexMaiorValor]) {
          indexMaiorValor = j;
        }
      }
      listaindexMaiorValor.add(indexMaiorValor);
      listaQuantidadePrestadores[indexMaiorValor] = 0;
    }

    List<String> listKeysOrdenadasFinal = [];

    listaindexMaiorValor.forEach((valor) {
      listKeysOrdenadasFinal.add(listKeys[valor]);
    });

    print(listaindexMaiorValor);

    listKeysOrdenadasFinal.forEach((element) {
      listPrincipaisBusinessModelTipoDeServico.add(BusinessModelTiposDeServico(
          codTipoServico: int.parse(element),
          descricao: '',
          icone: Icons.add,
          qtdePrestadoresDeServico: mapQuantidadeServicoUmaCidade[element]));
    });

    if (listPrincipaisBusinessModelTipoDeServico.length < 4) {
      listPrincipaisBusinessModelTipoDeServico =
          await ProviderTiposDeServico().getBusinessModels();
    }
    //GetQtdePrestadoresDeServicoPorTipoSeervicoECidade
    List<BusinessModelTiposDeServico> finalListTiposDeServico = [];
    listPrincipaisBusinessModelTipoDeServico.forEach((element) async {
      int qtePrestadores =
          await GetQtdePrestadoresDeServicoPorTipoSeervicoECidade().action();
      finalListTiposDeServico.add(BusinessModelTiposDeServico(
        codTipoServico: element.codTipoServico,
        descricao: element.descricao,
        icone: element.icone,
        qtdePrestadoresDeServico: qtePrestadores,
      ));
    });

    businessModelPrincipaisTiposDeServicoCidade =
        BusinessModelPrincipaisTiposDeServicoCidade(
      cidade: cidades[int.parse(id)],
      tiposDeServico: listPrincipaisBusinessModelTipoDeServico,
    );
    return businessModelPrincipaisTiposDeServicoCidade;
  }

  @override
  Future<List<BusinessModelPrincipaisTiposDeServicoCidade>>
      getBusinessModels() {
    // TODO: implement getBusinessModels
    throw UnimplementedError();
  }

  @override
  Future<RespostaProcessamento> removeBusinessModel(
      BusinessModelPrincipaisTiposDeServicoCidade businessModel) {
    // TODO: implement removeBusinessModel
    throw UnimplementedError();
  }

  @override
  Future<RespostaProcessamento> saveBusinessModel(
      BusinessModelPrincipaisTiposDeServicoCidade businessModel) {
    // TODO: implement saveBusinessModel
    throw UnimplementedError();
  }
}
