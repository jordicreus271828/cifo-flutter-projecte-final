import 'package:intl/intl.dart';

extension StringExtension on String {
  String toSentenceCase() {
    return (isEmpty) ? this : this[0].toUpperCase() + substring(1);
  }
}

extension DateTimeExtension on DateTime {
  String toFullDateString() {
    return DateFormat.yMMMMEEEEd("es").format(this);
  }
}
