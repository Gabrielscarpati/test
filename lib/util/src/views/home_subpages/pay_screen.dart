import 'package:flutter/material.dart';
import '../../../../features/payment/viewPayment.dart';
import '../../components/buttons/pay_button.dart';
import '../../models/bank_account_model.dart';
import '../../models/enums/payment_type.dart';
import '../../models/payment_model.dart';

class PayScreen extends StatelessWidget {
  final BankAccountModel account;

  const PayScreen({Key? key, required this.account}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 600,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Escolha o que deseja pagar',
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
              ),
              SizedBox(
                height: 20,
              ),
              PayButton(
                text: 'Pagar um boleto',
                icon: Icons.qr_code,
                onPress: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => PaymentPage(
                                paymentModel: PaymentModel(
                                    PaymentType.BRAZILIAN_BOLETO,
                                    account.balance),
                              )));
                },
              ),
              SizedBox(
                height: 20,
              ),
              PayButton(
                text: 'Pagar com crédito',
                icon: Icons.credit_card_rounded,
                onPress: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => PaymentPage(
                                paymentModel: PaymentModel(
                                    PaymentType.CREDIT_CARD,
                                    account.creditCardDto!.balance),
                              )));
                },
              ),
              SizedBox(
                height: 20,
              ),
              PayButton(
                text: 'Pagar Fatura',
                icon: Icons.analytics_sharp,
                onPress: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => PaymentPage(
                                paymentModel: PaymentModel(PaymentType.INVOICE,
                                    account.creditCardDto!.invoice),
                              )));
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
