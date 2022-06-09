import 'package:projeto_treinamento/daos/cidade/dataModelBuilderCidade.dart';
import 'package:projeto_treinamento/framework/daoWebApi.dart';

import 'dataModelCidade.dart';

class DaoCidade extends DaoWebApi<DataModelCidade, DataModelBuilderCidade> {
  DaoCidade()
      : super(
          dataModelBuilder: DataModelBuilderCidade(),
          server: "https://voadragons.com",
          model: "cidade",
        );        // acessando o banco diretamente

/*
/*{
    "estados": [
      {
        "sigla": "AC",
        "nome": "Acre",
        "cidades": [
          "Acrelândia",
          "Assis Brasil",
          "Brasiléia",
          "Bujari",
          "Capixaba",
          "Cruzeiro do Sul",
          "Epitaciolândia",
          "Feijó",
          "Jordão",
          "Mâncio Lima",
          "Manoel Urbano",
          "Marechal Thaumaturgo",
          "Plácido de Castro",
          "Porto Acre",
          "Porto Walter",
          "Rio Branco",
          "Rodrigues Alves",
          "Santa Rosa do Purus",
          "Sena Madureira",
          "Senador Guiomard",
          "Tarauacá",
          "Xapuri"
        ]
      }
    ]
  }*/

   */
}
