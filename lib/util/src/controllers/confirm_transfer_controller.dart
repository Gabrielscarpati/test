import 'package:flutter/material.dart';
import 'package:projeto_treinamento/main.dart';

import '../components/alerts/alert.dart';
import '../models/transfer_model.dart';
import '../services/bank_account_service.dart';

class ConfirmTransferController {
  TextEditingController messageController;

  ConfirmTransferController(this.messageController);

  BankAccountService _service = new BankAccountService();

  void transfer() async {
    TransferModel transaction = await storage.getTransfer();
    transaction.message = messageController.text;
    if (transaction.to!.isNotEmpty) {
      _service.transfer(transaction);
    } else {
      Alert.displaySimpleAlert("Erro", "Destinatário ausente.");
    }
  }
}
