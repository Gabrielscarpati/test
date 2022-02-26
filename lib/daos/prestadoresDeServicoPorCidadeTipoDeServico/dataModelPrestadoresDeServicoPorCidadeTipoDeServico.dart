import 'package:projeto_treinamento/daos/cidade/dataModelCidade.dart';
import 'package:projeto_treinamento/daos/prestadorDeServicos/dataModelPrestadorDeServicos.dart';
import 'package:projeto_treinamento/daos/tiposDeServico/dataModelTipoDeServico.dart';
import 'package:projeto_treinamento/framework/dataModel.dart';

class DataModelPrestadoresDeServicoPorCidadeTipoDeServico extends DataModel {
  final DataModelCidade cidade;
  final DataModelTipoDeServico tipoServico;
  final List<DataModelPrestadorDeServicos> prestadoresServico;

  DataModelPrestadoresDeServicoPorCidadeTipoDeServico({
    required this.cidade,
    required this.tipoServico,
    required this.prestadoresServico,
  }) : super(id: cidade.codCidade.toString() + '-' + tipoServico.codTipoServico.toString());
}
