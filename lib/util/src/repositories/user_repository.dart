import 'package:dio/dio.dart';
import '../models/login_model.dart';
import '../models/register_model.dart';
import '../services/api.dart';

class UserRepository {
  final dio = Dio();

  Future<Response> register(RegisterModel userToBeRegistered) async {
    return dio.post(registerUrl, data: userToBeRegistered);
  }

  Future<Response> login(LoginModel userToLogin) async {
    return dio.post(loginUrl, data: userToLogin);
  }
}
