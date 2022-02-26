import 'package:projeto_treinamento/businessModels/businessModelIcone.dart';
import 'package:projeto_treinamento/daos/icone/daoIcone.dart';
import 'package:projeto_treinamento/daos/icone/dataModelIcone.dart';
import 'package:projeto_treinamento/framework/providerDireto.dart';
import 'package:projeto_treinamento/providers/icone/adapterIcone.dart';

class ProviderIcone extends ProviderDireto<DataModelIcone, BusinessModelIcone, DaoIcone, AdapterIcone> {
  ProviderIcone()
      : super(
          dao: DaoIcone(),
          adapter: AdapterIcone(),
        );

  Future<BusinessModelIcone> whatsApp() {
    return this.getBusinessModel("whatsApp");
  }

  Future<BusinessModelIcone> statusOnline() {
    return this.getBusinessModel("statusOnline");
  }

  Future<BusinessModelIcone> Cidade() {
    return this.getBusinessModel("cidades");
  }

  Future<BusinessModelIcone> iconeCelular() {
    return this.getBusinessModel("cidades");
  }
}
