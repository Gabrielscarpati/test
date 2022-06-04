
import 'package:flutter_masked_text2/flutter_masked_text2.dart';

MoneyMaskedTextController createMoneyMaskedController() {
  return MoneyMaskedTextController(
      decimalSeparator: ',', thousandSeparator: '.', leftSymbol: 'R\$ ');
}
