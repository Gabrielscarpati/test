import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:projeto_treinamento/main.dart';

import '../components/alerts/alert.dart';
import '../models/bank_account_model.dart';
import '../models/erro_model.dart';
import '../models/statement_model.dart';
import '../models/transfer_model.dart';
import '../repositories/bank_account_repository.dart';
import '../utils/string_util.dart';
import '../utils/throw_error.dart';

class BankAccountService {
  final BankAccountRepository repository = new BankAccountRepository();

  Future<BankAccountModel> getBankAccount() async {
    try {
      return await repository.fetchBankAccount();
    } on DioError catch (e) {
      ApiError err = catchError(e);
      Alert.displaySimpleAlert(err.title, err.message);
      return BankAccountModel(
        id: 0,
        userName: "ERROR",
        accountNumber: 0,
        balance: 0,
      );
    }
  }

  Future<List<StatementModel>> getAllStatements() async {
    try {
      return await repository.fetchStatements();
    } on DioError {
      Alert.displaySimpleAlert(
          "Ocorreu um erro", "Não foi possível carregar seus dados.");
      return List.empty();
    }
  }

  void transfer(TransferModel transaction) async {
    try {
      await repository.transfer(transaction);
      Navigator.of(navigatorKey.currentContext!).pushReplacementNamed("/home");
      Alert.displaySimpleAlert(
          "Pronto!",
          "Você transferiu R\$ ${transaction.amount} para "
              "${transaction.toName} com sucesso!");
    } on DioError catch (e) {
      ApiError err = catchError(e);
      Alert.displaySimpleAlert(err.title, err.message);
    }
  }

  void deposit(double value) async {
    try {
      await repository.deposit(value);
      Navigator.of(navigatorKey.currentContext!).pushReplacementNamed("/home");
      Alert.displaySimpleAlert("Sucesso",
          "Você realizou um deposito no valor de ${convertToBRL(value)}");
    } on DioError catch (e) {
      ApiError err = catchError(e);
      Alert.displaySimpleAlert(err.title, err.message);
    }
  }
}
