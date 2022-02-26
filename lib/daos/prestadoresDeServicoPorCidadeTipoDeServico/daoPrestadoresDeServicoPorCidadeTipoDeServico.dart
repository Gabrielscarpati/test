import 'package:projeto_treinamento/framework/daoWebApi.dart';

import 'dataModelBuilderPrestadoresDeServicoPorCidadeTipoDeServico.dart';
import 'dataModelPrestadoresDeServicoPorCidadeTipoDeServico.dart';

class DaoPrestadoresDeServicoPorCidadeTipoDeServico extends DaoWebApi<DataModelPrestadoresDeServicoPorCidadeTipoDeServico, DataModelBuilderPrestadoresDeServicoPorCidadeTipoDeServico> {
  DaoPrestadoresDeServicoPorCidadeTipoDeServico()
      : super(
          dataModelBuilder: DataModelBuilderPrestadoresDeServicoPorCidadeTipoDeServico(),
          server: "https://voadragons.com",
          model: "prestadorservico_por_cidade_tiposervico",
        );
}
