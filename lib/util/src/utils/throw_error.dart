import 'package:dio/dio.dart';
import '../models/api_response.dart';
import '../models/erro_model.dart';

ApiError catchError(DioError e) {
  if (e.response != null) {
    var error = APIResponseError.fromJson(e.response!.data);
    String message = error.getMessageError();
    return ApiError(title: "Ocorreu um erro", message: message);
  }
  return ApiError(
      title: "Ocorreu um erro", message: 'Ocorreu um erro no servidor');
}
