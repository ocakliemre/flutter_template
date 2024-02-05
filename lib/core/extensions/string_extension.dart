import 'package:easy_localization/easy_localization.dart';

extension StringExtension on String {
  String get locale => this.tr();
  String get appDateFormat => DateTime.tryParse(this) == null
      ? this
      : DateFormat('yyyy-MM-dd hh:mm').format(DateTime.parse(this));

  String mask({
    required int start,
    int end = 0,
  }) {
    return ('*' * start) + substring(start, length - end) + ('*' * end);
  }

  bool? get toBool {
    if (this == '1' || this == 'true' || this == 'True') {
      return true;
    } else if (this == '0' || this == 'false' || this == 'False') {
      return false;
    } else {
      return null;
    }
  }

  String get toTl => '$this ₺';
}
