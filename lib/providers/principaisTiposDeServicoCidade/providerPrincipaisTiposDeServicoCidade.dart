import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:projeto_treinamento/businessModels/businessModelCidade.dart';
import 'package:projeto_treinamento/businessModels/businessModelDadosPrestador.dart';
import 'package:projeto_treinamento/businessModels/businessModelPrestadorDeServicoxCidade.dart';
import 'package:projeto_treinamento/businessModels/businessModelPrincipaisTiposDeServicoCidade.dart';
import 'package:projeto_treinamento/businessModels/businessModelTiposDeServico.dart';
import 'package:projeto_treinamento/daos/principaisTiposDeServicoCidade/daoPrincipaisTiposDeServicoCidade.dart';
import 'package:projeto_treinamento/daos/principaisTiposDeServicoCidade/dataModelPrincipaisTiposDeServicoCidade.dart';
import 'package:projeto_treinamento/daos/tiposDeServico/dataModelBuilderTipoDeServico.dart';
import 'package:projeto_treinamento/daos/tiposDeServico/dataModelTipoDeServico.dart';
import 'package:projeto_treinamento/framework/provider.dart';
import 'package:projeto_treinamento/framework/providerDireto.dart';
import 'package:projeto_treinamento/providers/cidade/providerCidade.dart';
import 'package:projeto_treinamento/providers/dadosPrestador/providerDadosPrestador.dart';
import 'package:projeto_treinamento/providers/tiposDeServico/providerTiposDeServico.dart';
import 'package:projeto_treinamento/util/resposta_processamento.dart';


class ProviderPrincipaisTiposDeServicoCidade
    extends Provider<BusinessModelPrincipaisTiposDeServicoCidade> {
  @override
  Future<BusinessModelPrincipaisTiposDeServicoCidade> getBusinessModel(
      String id) async {
    BusinessModelPrincipaisTiposDeServicoCidade
        dataModelPrincipaisTiposDeServicoCidade;

    List<BusinessModelCidade> cidades = await ProviderCidade().getBusinessModels();
    List<BusinessModelDadosPrestador> prestadores = await ProvideDadosPrestador().getBusinessModels();

    print(cidades);
    prestadores = prestadores
        .where((element) => element.city == cidades[int.parse(id)].nome)
        .toList();

    print(prestadores);

    List<BusinessModelTiposDeServico> listBusinessModelTipoDeServico = [];
    prestadores.forEach((element) {
      BusinessModelTiposDeServico tiposDeServico;
      element.roles.forEach((element) async {
        tiposDeServico = await ProviderTiposDeServico().getBusinessModel(element.toString());
        listBusinessModelTipoDeServico.add(tiposDeServico);
      });
    });


    List<BusinessModelTiposDeServico> listPrincipaisBusinessModelTipoDeServico = [];
    //verificar logica para principais tipos de servico
    Map mapQuantidadeServicoUmaCidade = {};


    for (int i = 0; i < listBusinessModelTipoDeServico.length; i++) {
      if(mapQuantidadeServicoUmaCidade.containsKey(listBusinessModelTipoDeServico[i].codTipoServico)){
        mapQuantidadeServicoUmaCidade[listBusinessModelTipoDeServico[i].codTipoServico] = mapQuantidadeServicoUmaCidade[listBusinessModelTipoDeServico[i].codTipoServico]+1;

      } else{
        mapQuantidadeServicoUmaCidade[listBusinessModelTipoDeServico[i].codTipoServico] = 1;
      }
    }

    print(mapQuantidadeServicoUmaCidade);

    List<int> listaQuantidadePrestadores = [];
    List<String> listKeys = [];

    mapQuantidadeServicoUmaCidade.forEach((key, value){
      listaQuantidadePrestadores.add(value);
      listBusinessModelTipoDeServico.add(key);
    });

    List<int> listaindexMaiorValor = [];
    for(int i = 0; i < listaQuantidadePrestadores.length; i++ ){
      int indexMaiorValor = i;
      for(int j = 0; j < listaQuantidadePrestadores.length; j++ ){
        if(listaQuantidadePrestadores[j] > listaQuantidadePrestadores[indexMaiorValor]){
          indexMaiorValor = j;
        }
      }
      listaindexMaiorValor.add(indexMaiorValor);
      listaQuantidadePrestadores[indexMaiorValor] = 0;
    }

    List<String> listKeysOrdenadasFinal = [];

    listaindexMaiorValor.forEach((valor){
      listKeysOrdenadasFinal.add(listKeys[valor]);
    });

    print(listaindexMaiorValor);

    listKeysOrdenadasFinal.forEach((element) {
      listPrincipaisBusinessModelTipoDeServico.add(BusinessModelTiposDeServico(
          codTipoServico: int.parse(element),
          descricao: '',
          icone: Icons.add,
          qtdePrestadoresDeServico: mapQuantidadeServicoUmaCidade[element]));
     }
    );


    dataModelPrincipaisTiposDeServicoCidade =
        BusinessModelPrincipaisTiposDeServicoCidade(
      cidade: cidades[int.parse(id)],
      tiposDeServico: listBusinessModelTipoDeServico,
    );
    return dataModelPrincipaisTiposDeServicoCidade;
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
