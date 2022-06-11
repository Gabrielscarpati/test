import 'package:projeto_treinamento/businessModels/businessModelCidade.dart';
import 'package:projeto_treinamento/providers/cidade/providerCidade.dart';

class GetCodCidade {
  String nomeCidade;
  GetCodCidade({required this.nomeCidade});
  Future<int> action() async {
    int response = 0;

    List<BusinessModelCidade> listaDeTodasAsCidades = [];
    listaDeTodasAsCidades = await ProviderCidade().getBusinessModels();

    for (int i = 0; i < listaDeTodasAsCidades.length; i++) {
      if (listaDeTodasAsCidades[i].nome == nomeCidade) {
        response = i;
        return response;
      }
    }
    return response;
  }
}