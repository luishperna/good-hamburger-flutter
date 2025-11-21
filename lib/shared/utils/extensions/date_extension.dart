import 'package:intl/intl.dart';

extension DateExtension on DateTime {
  String get toFormattedDate {
    return DateFormat.yMMMd('en_US').add_jm().format(this);
  }
}
