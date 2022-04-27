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
  static List<DataModelCidade> _dados = List.empty(growable: true)
    ..add(DataModelCidade(
      codCidade: 1,
      nome: "Colatina",
    ))
    ..add(DataModelCidade(
      codCidade: 2,
      nome: "Vitória",
    ))
    ..add(DataModelCidade(
      codCidade: 3,
      nome: "Vila Velha",
    ));
   */
}
