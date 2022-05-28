import 'package:projeto_treinamento/daos/prestadorInformation/dataModePrestadorInformation.dart';

import 'package:projeto_treinamento/framework/providerDireto.dart';
import 'package:projeto_treinamento/providers/prestadorInformation/adapterPrestadorInformation.dart';

import '../../businessModels/businessModelPrestadorInfomation.dart';
import '../../daos/prestadorInformation/daoPrestadorInformatio.dart';

class ProviderPrestadorInformation extends ProviderDireto<
    DataModelPrestadorInformation,
    BusinessModelPrestadorInformation,
    DaoPrestadorInformation,
    AdapterPrestadorInformation> {
  ProviderPrestadorInformation()
      : super(
          dao: DaoPrestadorInformation(),
          adapter: AdapterPrestadorInformation(),
        );
}
