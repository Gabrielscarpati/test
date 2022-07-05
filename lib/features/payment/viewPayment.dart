import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_countdown_timer/flutter_countdown_timer.dart';
import 'package:flutter_masked_text2/flutter_masked_text2.dart';
import 'package:in_app_purchases_paywall_ui/in_app_purchases_paywall_ui.dart';
import 'package:linkfive_purchases_provider/linkfive_purchases_provider.dart';
import 'package:pix_flutter/pix_flutter.dart';
import 'package:linkfive_purchases/linkfive_purchases.dart';
import 'package:provider/provider.dart';

import 'escolhaFormaPagamento.dart';

class ViewPayment extends StatefulWidget {
  const ViewPayment({
    Key? key,
  }) : super(key: key);

  @override
  _ViewPaymentState createState() => _ViewPaymentState();
}

class _ViewPaymentState extends State<ViewPayment> {
  final moneyMaskedController = MoneyMaskedTextController(
      decimalSeparator: ',', thousandSeparator: '.', leftSymbol: 'R\$ ');

  bool isErrorVisible = false;

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          // ...
          ChangeNotifierProvider(
            create: (context) => LinkFiveProvider(
                "64b1ce4178c9e09d2232f36fecf0ca63027fe0d15b25ccbcd62e4a880e3afbbc"),
            lazy: false,
          ),
        ],
        child: Consumer<LinkFiveProvider>(builder: (_, linkFiveProvider, __) {
          return PaywallScaffold(
              appBarTitle: "LinkFive Premium",
              child: SimplePaywall(
                  headerContainer: Container(
                      margin: EdgeInsets.all(16),
                      height: 100,

                     // child:  EscolhaFormaPagamento(),
                  ),
                  callbackInterface: linkFiveProvider.callbackInterface,
                 //subscriptionListData: linkFiveProvider.paywallUIHelperData(context),
                  title: "Go Premium",
                  // SubTitle
                  subTitle: "All features at a glance",
                  // Add as many bullet points as you like

                  bulletPoints: [
                    IconAndText(Icons.stop_screen_share_outlined, "No Ads"),
                    IconAndText(Icons.hd, "Premium HD"),
                    IconAndText(Icons.sort, "Access to All Premium Articles")
                  ],

                   subscriptionListData: [
                    SubscriptionData(
                        durationTitle: "Yearly",
                        durationShort: "1 year",
                        price: "€14,99€",
                        dealPercentage: 69,
                        productDetails: "Dynamic purchase data",
                        index: 0),
                    SubscriptionData(
                        durationTitle: "Quarterly",
                        durationShort: "3 Months",
                        price: "€6,99",
                        dealPercentage: 42,
                        productDetails: "Dynamic purchase data",
                        index: 2),
                    SubscriptionData(
                        durationTitle: "Monthly",
                        durationShort: "1 month",
                        price: "3,99€",
                        dealPercentage: 0,
                        productDetails: "Dynamic purchase data",
                        index: 3)
                  ],

                  // Shown if isPurchaseSuccess == true
                  successTitle: "You're a Premium User!",
                  // Shown if isPurchaseSuccess == true
                  successSubTitle: "Thanks for your Support!",
                  // Widget can be anything. Shown if isPurchaseSuccess == true
                  successWidget: Container(
                      padding: EdgeInsets.only(top: 16, bottom: 16),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ElevatedButton(
                              child: Text("Let's go!"),
                              onPressed: () {
                                print("let‘s go to the home widget again");
                              },
                            )
                          ])),
                  tosData: TextAndUrl(
                      "Terms of Service", "https://www.linkfive.io/tos"),
                  // provide your PP
                  ppData: TextAndUrl(
                      "Privacy Policy", "https://www.linkfive.io/privacy"),
                  // add a custom campaign widget
                  campaignWidget: CampaignBanner(
                    headline: "🥳 Summer Special Sale",

                  )));
        }));
  }
}

class PurchaseHandler extends DefaultPurchaseHandler {
  @override
  Future<bool> purchase(SubscriptionData productDetails) async {
    // show loading
    isPendingPurchase = true;

    // your logic
    await Future.delayed(Duration(seconds: 1));

    PixFlutter pixFlutter = PixFlutter(
        payload: Payload(
            pixKey: 'SUA_CHAVE_PIX',
            // A descrição está desativada por um erro no próprio API Pix, que não deixa processar pagamentos se ela estiver presente.
            // Assim que o bug for consertado, a funcionalidade será adicionada de volta.
            description: 'DESCRIÇÃO_DA_COMPRA',
            merchantName: 'MERCHANT_NAME',
            merchantCity: 'CITY_NAME',
            txid: 'TXID', // Até 25 caracteres para o QR Code estático
            amount: 'AMOUNT'));
    pixFlutter.getQRCode();

    // show success purchase and end loading
    purchaseState = PurchaseState.PURCHASED;
    isPendingPurchase = false;
    return true;
  }

  @override
  Future<bool> restore() async {
    // show loading
    isPendingPurchase = true;
    // your logic
    await Future.delayed(Duration(seconds: 1));
    // show success purchase and end loading
    purchaseState = PurchaseState.PURCHASED;
    isPendingPurchase = false;
    return true;
  }
}
