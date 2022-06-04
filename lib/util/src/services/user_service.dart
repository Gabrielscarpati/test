import 'package:projeto_treinamento/main.dart';
import 'package:projeto_treinamento/src/components/alerts/alert.dart';
import 'package:projeto_treinamento/src/exceptions/validation_exception.dart';
import 'package:projeto_treinamento/src/models/enums/request.dart';
import 'package:projeto_treinamento/src/models/erro_model.dart';
import 'package:projeto_treinamento/src/models/login_model.dart';
import 'package:projeto_treinamento/src/models/register_model.dart';
import 'package:projeto_treinamento/src/models/user_model.dart';
import 'package:projeto_treinamento/src/repositories/user_repository.dart';
import 'package:projeto_treinamento/src/utils/throw_error.dart';
import 'package:projeto_treinamento/src/validations/login_validation.dart';
import 'package:projeto_treinamento/src/validations/register_validation.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class UserService {
  final UserRepository userRepository = new UserRepository();

  Future<RequestState> login(LoginModel user) async {
    try {
      validateLogin(user);
      var response = await userRepository.login(user);
      storage.setToken(UserModel.fromJson(response.data).token!);
      Navigator.of(navigatorKey.currentContext!).pushReplacementNamed('/home');
      return RequestState.SUCCESSFUL;
    } on ValidationException catch (e) {
      Alert.displaySimpleAlert(e.title, e.message);
      return RequestState.NONE;
    } on DioError catch (e) {
      ApiError err = catchError(e);
      Alert.displaySimpleAlert(err.title, err.message);
      return RequestState.ERROR;
    }
  }

  Future<RequestState> register(RegisterModel model) async {
    try {
      validateRegister(model);
      await userRepository.register(model);
      Navigator.of(navigatorKey.currentContext!).pushReplacementNamed('/');
      Alert.displaySimpleAlert('Sucesso', 'Cadastro realizado com sucesso!');
      return RequestState.SUCCESSFUL;
    } on ValidationException catch (e) {
      Alert.displaySimpleAlert(e.title, e.message);
      return RequestState.NONE;
    } on DioError catch (e) {
      ApiError err = catchError(e);
      Alert.displaySimpleAlert(err.title, err.message);
      return RequestState.ERROR;
    }
  }
}
