
import 'package:projeto_treinamento/util/src/controllers/statementInterface.dart';
import '../models/bank_account_model.dart';
import '../models/statement_model.dart';
import '../services/bank_account_service.dart';

class BankAccountController extends StatementInterface {
  BankAccountModel bankAccountModel = BankAccountModel.empty();
  final BankAccountService accountService = new BankAccountService();

  Future<BankAccountModel> fetchBankAccount() async {
    bankAccountModel = await accountService.getBankAccount();
    return accountService.getBankAccount();
  }

  @override
  Future<List<StatementModel>> fetchStatements() async {
    bankAccountModel = await accountService.getBankAccount();
    return accountService.getAllStatements();
  }
}