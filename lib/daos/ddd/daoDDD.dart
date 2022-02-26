import 'package:projeto_treinamento/framework/daoPadrao.dart';

import 'dataModelDDD.dart';

class DaoDDD extends DaoPadrao<DataModelDDD> {
  DaoDDD() : super(dados: _dados);

  List<int> getCodigosDDDs() {
    List<int> listaCodigosDosDDDs = List.empty(growable: true);
    for (int posicao = 0; posicao < _dados.length; posicao++) {
      DataModelDDD dataModelDDD = _dados[posicao];
      listaCodigosDosDDDs.add(dataModelDDD.ddd);
    }
    return listaCodigosDosDDDs;
  }

  static List<DataModelDDD> _dados = List.empty(growable: true)
    ..add(DataModelDDD(
      ddd: 11,
      uf: "SP",
    ))
    ..add(DataModelDDD(
      ddd: 27,
      uf: "ES",
    ));
}
/*
   static var _dados = [
    {
      "DDD": 11,
      "UF": 'SP',
    },
    {
      "DDD": 12,
      "UF": 'SP',
    },
    {
      "DDD": 13,
      "UF": 'SP',
    },
    {
      "DDD": 14,
      "UF": 'SP',
    },
    {
      "DDD": 15,
      "UF": 'SP',
    },
    {
      "DDD": 16,
      "UF": 'SP',
    },
    {
      "DDD": 17,
      "UF": 'SP',
    },
    {
      "DDD": 18,
      "UF": 'SP',
    },
    {
      "DDD": 19,
      "UF": 'SP',
    },
    {
      "DDD": 21,
      "UF": 'RJ',
    },
    {
      "DDD": 22,
      "UF": 'RJ',
    },
    {
      "DDD": 24,
      "UF": 'RJ',
    },
    {
      "DDD": 27,
      "UF": 'ES',
    },
    {
      "DDD": 28,
      "UF": 'ES',
    },
    {
      "DDD": 31,
      "UF": 'MG',
    },
    {
      "DDD": 32,
      "UF": 'MG',
    },
    {
      "DDD": 33,
      "UF": 'MG',
    },
    {
      "DDD": 34,
      "UF": 'MG',
    },
    {
      "DDD": 35,
      "UF": 'MG',
    },
    {
      "DDD": 37,
      "UF": 'MG',
    },
    {
      "DDD": 38,
      "UF": 'MG',
    },
    {
      "DDD": 41,
      "UF": 'PR',
    },
    {
      "DDD": 42,
      "UF": 'PR',
    },
    {
      "DDD": 43,
      "UF": 'PR',
    },
    {
      "DDD": 44,
      "UF": 'PR',
    },
    {
      "DDD": 45,
      "UF": 'PR',
    },
    {
      "DDD": 46,
      "UF": 'PR',
    },
    {
      "DDD": 47,
      "UF": 'SC',
    },
    {
      "DDD": 48,
      "UF": 'SC',
    },
    {
      "DDD": 49,
      "UF": 'SC',
    },
    {
      "DDD": 51,
      "UF": 'RS',
    },
    {
      "DDD": 53,
      "UF": 'RS',
    },
    {
      "DDD": 54,
      "UF": 'RS',
    },
    {
      "DDD": 55,
      "UF": 'RS',
    },
    {
      "DDD": 61,
      "UF": 'DF',
    },
    {
      "DDD": 62,
      "UF": 'GO',
    },
    {
      "DDD": 63,
      "UF": 'TO',
    },
    {
      "DDD": 64,
      "UF": 'GO',
    },
    {
      "DDD": 65,
      "UF": 'MT',
    },
    {
      "DDD": 66,
      "UF": 'MT',
    },
    {
      "DDD": 67,
      "UF": 'MS',
    },
    {
      "DDD": 68,
      "UF": 'AC',
    },
    {
      "DDD": 69,
      "UF": 'RO',
    },
    {
      "DDD": 71,
      "UF": 'BA',
    },
    {
      "DDD": 73,
      "UF": 'BA',
    },
    {
      "DDD": 74,
      "UF": 'BA',
    },
    {
      "DDD": 75,
      "UF": 'BA',
    },
    {
      "DDD": 77,
      "UF": 'BA',
    },
    {
      "DDD": 79,
      "UF": 'SE',
    },
    {
      "DDD": 81,
      "UF": 'PE',
    },
    {
      "DDD": 82,
      "UF": 'AL',
    },
    {
      "DDD": 83,
      "UF": 'PB',
    },
    {
      "DDD": 84,
      "UF": 'RN',
    },
    {
      "DDD": 85,
      "UF": 'CE',
    },
    {
      "DDD": 86,
      "UF": 'PI',
    },
    {
      "DDD": 87,
      "UF": 'PE',
    },
    {
      "DDD": 88,
      "UF": 'CE',
    },
    {
      "DDD": 89,
      "UF": 'PI',
    },
    {
      "DDD": 91,
      "UF": 'PA',
    },
    {
      "DDD": 92,
      "UF": 'AM',
    },
    {
      "DDD": 93,
      "UF": 'PA',
    },
    {
      "DDD": 94,
      "UF": 'PA',
    },
    {
      "DDD": 95,
      "UF": 'RR',
    },
    {
      "DDD": 96,
      "UF": 'AP',
    },
    {
      "DDD": 97,
      "UF": 'AM',
    },
    {
      "DDD": 98,
      "UF": 'MA',
    },
    {
      "DDD": 99,
      "UF": 'MA',
    },
  ];
*/
