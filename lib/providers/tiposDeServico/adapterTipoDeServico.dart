import 'package:flutter/material.dart';
import 'package:projeto_treinamento/businessModels/businessModelIcone.dart';
import 'package:projeto_treinamento/businessModels/businessModelTiposDeServico.dart';
import 'package:projeto_treinamento/daos/icone/dataModelIcone.dart';
import 'package:projeto_treinamento/daos/tiposDeServico/dataModelTipoDeServico.dart';
import 'package:projeto_treinamento/framework/adapter.dart';
import 'package:projeto_treinamento/providers/icone/adapterIcone.dart';
import 'package:projeto_treinamento/util/getQtdePrestadoresDeServicoPorTipoSeervicoECidade.dart';

class AdapterTipoDeServico
    extends Adapter<BusinessModelTiposDeServico, DataModelTipoDeServico> {
  @override
  Future<BusinessModelTiposDeServico> createBusinessModel(
      DataModelTipoDeServico? dataModel) async {
    if (dataModel == null)
      return BusinessModelTiposDeServico.vazio();
    else {
      //BusinessModelIcone businessModelIcone = await AdapterIcone().createBusinessModel(dataModel.icone);
      return BusinessModelTiposDeServico(
        codTipoServico: dataModel.codTipoServico,
        descricao: dataModel.descricao,
        icone: Icons.add,
        qtdePrestadoresDeServico: 0,
      );
    }
  }

  @override
  Future<DataModelTipoDeServico> createDataModel(
      BusinessModelTiposDeServico businessModel) async {
    return DataModelTipoDeServico(
      codTipoServico: businessModel.codTipoServico,
      descricao: businessModel.descricao,
    );
  }
}
