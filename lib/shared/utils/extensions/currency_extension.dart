import 'package:intl/intl.dart';

extension CurrencyExtension on int {
  String get toCurrency {
    final format = NumberFormat.currency(
      locale: 'pt_BR',
      symbol: 'R\$',
      decimalDigits: 2,
    );
    return format.format(this / 100);
  }
}
