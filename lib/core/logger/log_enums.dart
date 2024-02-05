import 'dart:io';
import 'package:json_annotation/json_annotation.dart';

@JsonEnum(valueField: 'level')
enum LogLevel {
  @JsonValue('ERROR')
  error,
  @JsonValue('INFO')
  info,
}

@JsonEnum(valueField: 'platform')
enum LogPlatform {
  @JsonValue(1)
  web,
  @JsonValue(2)
  android,
  @JsonValue(3)
  ios,
  @JsonValue(4)
  other,
}

extension LogPlatformExtension on LogPlatform {
  LogPlatform get logPlatform {
    if (Platform.isAndroid) {
      return LogPlatform.android;
    } else if (Platform.isIOS) {
      return LogPlatform.ios;
    } else {
      return LogPlatform.other;
    }
  }
}
