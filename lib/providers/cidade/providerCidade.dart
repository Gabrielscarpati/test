import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:projeto_treinamento/businessModels/businessModelCidade.dart';
import 'package:projeto_treinamento/daos/cidade/daoCidade.dart';
import 'package:projeto_treinamento/daos/cidade/dataModelCidade.dart';
import 'package:projeto_treinamento/framework/provider.dart';
import 'package:projeto_treinamento/framework/providerDireto.dart';
import 'package:projeto_treinamento/util/resposta_processamento.dart';

import 'adapterCidade.dart';

class ProviderCidade extends Provider<BusinessModelCidade> {
  @override
  Future<BusinessModelCidade> getBusinessModel(String id) {
    // TODO: implement getBusinessModel
    throw UnimplementedError();
  }

  @override
  Future<List<BusinessModelCidade>> getBusinessModels() async {
    final String response =
        await rootBundle.loadString('lib/daos/cidade/cidades.json');
    Map<String, dynamic> data = await json.decode(response);
    List<dynamic> estados = data["estados"];
    List<BusinessModelCidade> listacidades = List.empty(growable: true);
    print(estados);

    estados.forEach((estado) {
      String sigla = estado["sigla"];
      List<dynamic> cidades = estado["cidades"];
      cidades.forEach((cidade) {
        String nome = cidade + " - " + sigla;
        listacidades.add(BusinessModelCidade(
            codCidade: nome.hashCode, nome: nome, totalPrestadoresServico: 0));
      });
    });

    return listacidades;
  }

  @override
  Future<RespostaProcessamento> removeBusinessModel(businessModel) {
    // TODO: implement removeBusinessModel
    throw UnimplementedError();
  }

  @override
  Future<RespostaProcessamento> saveBusinessModel(businessModel) {
    // TODO: implement saveBusinessModel
    throw UnimplementedError();
  }
}

// pegar um ou mais datamoveis(dao) e devolver business models