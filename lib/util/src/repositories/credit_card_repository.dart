import 'package:dio/dio.dart';
import 'package:projeto_treinamento/util/src/repositories/util.dart';
import '../models/statement_model.dart';
import '../services/api.dart';

class CreditCardRepository {
  final dio = Dio();

  Future<List<StatementModel>> fetchStatements() async {
    dio.options.headers = await getAuthHeaders();
    final response = await dio.get(creditCardUrl + "/statements");
    return List.from(response.data)
        .map((statement) => StatementModel.fromJson(statement))
        .toList();
  }
}
