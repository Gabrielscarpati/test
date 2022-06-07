import 'package:projeto_treinamento/daos/listaDeServicos/listaDeServicos.dart';
import 'package:projeto_treinamento/daos/tiposDeServico/dataModelBuilderTipoDeServico.dart';
import 'package:projeto_treinamento/daos/tiposDeServico/firebaseinterfaceTiposDeServico.dart';
import 'package:projeto_treinamento/framework/dao.dart';
import 'package:projeto_treinamento/framework/daoWebApi.dart';
import 'package:projeto_treinamento/util/resposta_processamento.dart';

import 'dataModelTipoDeServico.dart';

//class DaoDadosPrestador extends Dao<DataModelDadosPrestador> {
class DaoTipoDeServico extends Dao<DataModelTipoDeServico> {
  FirebaseinterfaceTiposDeServico firebaseInterface =
      FirebaseinterfaceTiposDeServico(
          tableName: 'listaServices',
          dataModelBuilder: DataModelBuilderTipoDeServico());

  @override
  Future<DataModelTipoDeServico?> getDataModel(String id) async {
    await firebaseInterface
        .getDataModelsFromFirebase(DataModelBuilderTipoDeServico());
  }

  @override
  Future<List<DataModelTipoDeServico>> getDataModels() async {
    List<String> listaServicos =
        await GetListaServicosFirebase().getListaServicosFirebase();
    List<DataModelTipoDeServico> listaDatamodelsTipoDeServico = [];

    for (int i = 0; i < listaServicos.length; i++) {
      listaDatamodelsTipoDeServico.add(DataModelTipoDeServico(
          codTipoServico: i, descricao: listaServicos[i]));
    }
    return listaDatamodelsTipoDeServico;
  }

  @override
  Future<RespostaProcessamento> removeDataModel(
      DataModelTipoDeServico dataModel) {
    // TODO: implement removeDataModel
    throw UnimplementedError();
  }

  @override
  Future<RespostaProcessamento> saveDataModel(
      DataModelTipoDeServico dataModel) {
    // TODO: implement saveDataModel
    throw UnimplementedError();
  }

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
