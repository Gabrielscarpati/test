import 'package:projeto_treinamento/daos/dadosPrestador/daoDadosPrestador.dart';
import 'package:projeto_treinamento/daos/dadosPrestador/dataModelDadosPrestador.dart';
import 'package:projeto_treinamento/framework/providerDireto.dart';
import '../../businessModels/businessModelDadosPrestador.dart';
import '../../businessModels/businessModelPrestadorInfomation.dart';
import 'adapterDadosPrestador.dart';

class ProvideDadosPrestador extends ProviderDireto<
    DataModelDadosPrestador,
    BusinessModelDadosPrestador,
    DaoDadosPrestador,
    AdapterDadosPrestador> {
  ProvideDadosPrestador()
      : super(
          dao: DaoDadosPrestador(),
          adapter: AdapterDadosPrestador(),
        );
}
