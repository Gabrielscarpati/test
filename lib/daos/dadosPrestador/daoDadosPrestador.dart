import 'package:projeto_treinamento/daos/dadosPrestador/dataModelDadosPrestador.dart';
import 'package:projeto_treinamento/util/resposta_processamento.dart';
import '../../framework/dao.dart';
import 'dataModelBuilderDadosPrestador.dart';
import 'firebaseInterfaceDadosPrestador.dart';


 class DaoDadosPrestador extends Dao<DataModelDadosPrestador>{

   FirebaseinterfaceDadosPrestador firebaseInterface = FirebaseinterfaceDadosPrestador(
       tableName: 'dadosPrestador',
       dataModelBuilder: DataModelBuilderDadosPrestador(),
   );

   Future<DataModelDadosPrestador?> getDataModel(String id) async{
     DataModelDadosPrestador? dataModelDadosPrestador;
     dataModelDadosPrestador = await firebaseInterface.getDataModelFromFirebase();
     return dataModelDadosPrestador;
   }

  Future<List<DataModelDadosPrestador>> getDataModels() async{
    List<DataModelDadosPrestador> listaDataModelDadosPrestador = [];
    return listaDataModelDadosPrestador;
  }

  Future<RespostaProcessamento> saveDataModel(DataModelDadosPrestador dataModel) async{
    return RespostaProcessamento.ok();
  }

  Future<RespostaProcessamento> removeDataModel(DataModelDadosPrestador dataModel)async{
    return RespostaProcessamento.ok();

  }
}
