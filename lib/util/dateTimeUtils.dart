import 'package:intl/intl.dart';

String formataDataDDMMYYYY(DateTime data) {
  return DateFormat('dd/MM/yyyy').format(data);
}
