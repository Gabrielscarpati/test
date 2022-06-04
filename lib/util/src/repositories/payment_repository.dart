import 'package:dio/dio.dart';
import 'package:projeto_treinamento/util/src/repositories/util.dart';

import '../models/payment_model.dart';
import '../services/api.dart';

class PaymentRepository {
  final dio = Dio();

  Future<void> payBoleto(PaymentModel model) async {
    dio.options.headers = await getAuthHeaders();
    await dio.post(payBoletoUrl, data: model.toJson());
  }

  Future<void> payWithCreditCard(PaymentModel model) async {
    dio.options.headers = await getAuthHeaders();
    await dio.post(payCreditCardUrl, data: model.toJson());
  }

  Future<void> payInvoice(PaymentModel model) async {
    dio.options.headers = await getAuthHeaders();
    await dio.post(payInvoiceUrl, data: model.toJson());
  }
}
