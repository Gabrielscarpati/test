import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/transfer_model.dart';

class Storage {
  Future setToken(String token) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('token', token);
  }

  Future<String> getToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String response =
        prefs.getString('token') != null ? prefs.getString('token')! : "";
    return response;
  }

  Future setTransfer(TransferModel transaction) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('transaction', json.encode(transaction));
  }

  Future<TransferModel> getTransfer() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return TransferModel.fromJson(
        json.decode(prefs.get('transaction')! as String));
  }

  Future setAccountName(String name) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('accountName', name);
  }

  Future<String> getAccountName() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('accountName')!;
  }

  Future setAccountNumber(String number) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('accountNumber', number);
  }

  Future<String> getAccountNumber() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('accountNumber')!;
  }
}
