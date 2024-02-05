import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

extension DateFormatter on DateTime? {
  String get appFormat =>
      this == null ? '' : DateFormat('dd/MM/yyyy').format(this!);
  String get appFormatWithTime =>
      this == null ? '' : DateFormat('dd/MM/yyyy kk:mm').format(this!);
  String get appFormatTime =>
      this == null ? '' : DateFormat('kk:mm').format(this!);

  int get toInt =>
      this == null ? 0 : int.tryParse(appFormat.replaceAll('/', '')) ?? 0;
  int get toIntOnlyTime =>
      this == null ? 0 : int.tryParse(DateFormat('kkmm').format(this!)) ?? 0;
  int get toIntWithTime =>
      this == null ? 0 : int.tryParse('$toInt$toIntOnlyTime') ?? 0;
}

extension TimeFormatter on TimeOfDay? {
  DateTime get toDateTime => DateTime(
        DateTime.now().year,
        DateTime.now().month,
        DateTime.now().day,
        this?.hour ?? 0,
        this?.minute ?? 0,
      );

  int get toInt {
    return toDateTime.toIntOnlyTime;
  }
}

extension MyDateExtension on DateTime {
  DateTime getDateOnly() {
    return DateTime(year, month, day);
  }
}
