import 'package:intl/intl.dart';

extension CurrencyExtension on int {
  String get toCurrency {
    final format = NumberFormat.currency(
      locale: 'en_US',
      symbol: '\$',
      decimalDigits: 2,
    );
    return format.format(this / 100);
  }
}
