import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:projeto_treinamento/main.dart';
import 'package:projeto_treinamento/src/components/alerts/alert.dart';
import 'package:projeto_treinamento/src/models/erro_model.dart';
import 'package:projeto_treinamento/src/models/payment_model.dart';
import 'package:projeto_treinamento/src/models/pix_request.dart';
import 'package:projeto_treinamento/src/models/pix_response.dart';
import 'package:projeto_treinamento/src/repositories/payment_repository.dart';
import 'package:projeto_treinamento/src/repositories/pix_repository.dart';
import 'package:projeto_treinamento/src/utils/throw_error.dart';
import 'package:projeto_treinamento/src/views/home_subpages/initial_screen_subpages/pix_screen.dart';

class PixService {
  final PixRepository repository = new PixRepository();

  Future<List<PixResponse>> findAll() async {
    try {
      return await repository.findAll();
    } on DioError catch (e) {
      ApiError err = catchError(e);
      Alert.displaySimpleAlert(err.title, err.message);
      return [];
    }
  }

  Future<void> register(PixRequest model) async {
    try {
      await repository.register(model);
      Navigator.push(navigatorKey.currentContext!,
          MaterialPageRoute(builder: (context) => PixScreen()));
      Alert.displaySimpleAlert("Sucesso", "Sua chave Pix foi registrada!");
    } on DioError catch (e) {
      ApiError err = catchError(e);
      Alert.displaySimpleAlert(err.title, err.message);
      return null;
    }
  }

  Future<void> update(PixResponse model) async {
    try {
      await repository.update(model);
      Navigator.push(navigatorKey.currentContext!,
          MaterialPageRoute(builder: (context) => PixScreen()));
      Alert.displaySimpleAlert("Pronto", "Sua chave Pix foi editada!");
    } on DioError catch (e) {
      ApiError err = catchError(e);
      Alert.displaySimpleAlert(err.title, err.message);
      return null;
    }
  }

  Future<void> delete(String id) async {
    try {
      await repository.delete(id);
      Navigator.push(navigatorKey.currentContext!,
          MaterialPageRoute(builder: (context) => PixScreen()));
      Alert.displaySimpleAlert("Sucesso", "Sua chave Pix foi excluída.");
    } on DioError catch (e) {
      ApiError err = catchError(e);
      Alert.displaySimpleAlert(err.title, err.message);
      return null;
    }
  }
}
