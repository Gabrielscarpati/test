import 'package:projeto_treinamento/daos/cidade/dataModelBuilderCidade.dart';
import 'package:projeto_treinamento/daos/prestadorDeServicos/dataModelBuilderPrestadorDeServicos.dart';
import 'package:projeto_treinamento/daos/prestadorDeServicos/dataModelPrestadorDeServicos.dart';
import 'package:projeto_treinamento/daos/tiposDeServico/dataModelBuilderTipoDeServico.dart';
import 'package:projeto_treinamento/framework/dataModelBuilder.dart';

import 'dataModelPrestadoresDeServicoPorCidadeTipoDeServico.dart';

class DataModelBuilderPrestadoresDeServicoPorCidadeTipoDeServico extends DataModelBuilder<DataModelPrestadoresDeServicoPorCidadeTipoDeServico> {
  @override
  DataModelPrestadoresDeServicoPorCidadeTipoDeServico? createDataModel(Map<String, dynamic> json) {
    // {
    //  "codCidade":1,
    //  "codTipoServico":3,
    //  "prestadoresServico":[
    //    {
    //      "codPrestadorServico":30,
    //      "nome":"Pedro",
    //      "telefone":"3333-3333",
    //      "urlFoto":"https://www.planetware.com/wpimages/2020/02/france-in-pictures-beautiful-places-to-photograph-eiffel-tower.jpg",
    //      "nota":0.0,
    //      "totalDeAvaliacoes":0
    //    }
    //   ]
    //  }

    return DataModelPrestadoresDeServicoPorCidadeTipoDeServico(
      cidade: DataModelBuilderCidade().createDataModel(json["cidade"])!,
      tipoServico: DataModelBuilderTipoDeServico().createDataModel(json["tipoServico"])!,
      prestadoresServico: _getPrestadoresDeServicosoFromJson(json["prestadoresServico"]),
    );
  }

  List<DataModelPrestadorDeServicos> _getPrestadoresDeServicosoFromJson(List<dynamic> json) {
    List<DataModelPrestadorDeServicos> lista = List.empty(growable: true);
    json.forEach((element) {
      lista.add(DataModelBuilderPrestadorDeServicos().createDataModel(element)!);
    });
    return lista;
  }

  @override
  Map<String, dynamic>? createJson(DataModelPrestadoresDeServicoPorCidadeTipoDeServico? dataModel) {
    if (dataModel == null) return null;
    return {};
  }
}
