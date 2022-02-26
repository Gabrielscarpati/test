import 'package:projeto_treinamento/daos/tiposDeServico/dataModelBuilderTipoDeServico.dart';
import 'package:projeto_treinamento/framework/daoWebApi.dart';

import 'dataModelTipoDeServico.dart';

class DaoTipoDeServico extends DaoWebApi<DataModelTipoDeServico, DataModelBuilderTipoDeServico> {
  DaoTipoDeServico()
      : super(
          dataModelBuilder: DataModelBuilderTipoDeServico(),
          server: "https://voadragons.com",
          model: "tiposervico",
        );

/*
  static List<DataModelTipoDeServico> _dados = List.empty(growable: true)
    ..add(DataModelTipoDeServico(
      codTipoServico: 1,
      descricao: 'Serviços Gerais',
      idIcone: "serviçosGerais",
    ))
    ..add(DataModelTipoDeServico(
      codTipoServico: 2,
      descricao: 'Motoboy',
      idIcone: "motoboy",
    ))
    ..add(DataModelTipoDeServico(
      codTipoServico: 3,
      descricao: 'Babá',
      idIcone: "baba",
    ))
    ..add(DataModelTipoDeServico(
      codTipoServico: 4,
      descricao: 'Motorista',
      idIcone: "motorista",
    ))
    ..add(DataModelTipoDeServico(
      codTipoServico: 5,
      descricao: 'Eletricista',
      idIcone: "eletricista",
    ))
    ..add(DataModelTipoDeServico(
      codTipoServico: 6,
      descricao: 'Pedreiro',
      idIcone: "pedreiro",
    ))
    ..add(DataModelTipoDeServico(
      codTipoServico: 7,
      descricao: 'Bombeiro/Encanador',
      idIcone: "bombeiroEncanador",
    ));
  */
/*
  List<int> getCodigosPrestadorDeServico() {
    List<int> listaCodigosDosPrestadoresDeServico = List.empty(growable: true);
    for (int posicao = 0; posicao < _dados.length; posicao++) {
      DataModelTipoDeServico dataModel = _getByPos(posicao);
      listaCodigosDosPrestadoresDeServico.add(dataModel.codTipoServico);
    }
    return listaCodigosDosPrestadoresDeServico;
  }
   */
}
