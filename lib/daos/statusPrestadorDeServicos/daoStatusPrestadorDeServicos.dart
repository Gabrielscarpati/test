import 'dart:math';
import 'package:projeto_treinamento/framework/dao.dart';
import 'dataModelStatusPrestadorDeServicos.dart';

class DaoStatusPrestadorDeServicos extends Dao<DataModelStatusPrestadorDeServicos> {

  @override
  Future<DataModelStatusPrestadorDeServicos?> getDataModel(String telefone) async {
    // consultar uma api do whatsapp que retorna o status online de um telefone
    return DataModelStatusPrestadorDeServicos(
      telefone: telefone,
      onLine: Random().nextBool(),
    );
  }

  @override
  Future<List<DataModelStatusPrestadorDeServicos>> getDataModels() {
    throw UnimplementedError();
  }

  @override
  removeDataModel(DataModelStatusPrestadorDeServicos dataModel) {
    throw UnimplementedError();
  }

  @override
  saveDataModel(DataModelStatusPrestadorDeServicos dataModel) {
    throw UnimplementedError();
  }
}
