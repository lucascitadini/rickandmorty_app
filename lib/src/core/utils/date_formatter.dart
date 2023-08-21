
import 'dart:developer';

import 'package:intl/intl.dart';

sealed class DateFormatter {
  static const _ddMMyyyyHHmmss = 'dd/MM/yyyy HH:mm:ss';

  static String convertStringDatePatterns(
      {required String date,}) {
    try {
      final formatter = DateFormat(_ddMMyyyyHHmmss);
      final dateTime = DateTime.parse(date);
      return formatter.format(dateTime);
    } catch (e) {
      log('Error during date [$date] conversion');
      return date;
    }
  }
}