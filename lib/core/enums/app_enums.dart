import 'dart:io';

import 'package:json_annotation/json_annotation.dart';

enum AppMode {
  release,
  debug,
}

enum DeviceType {
  phone,
  tablet,
}

@JsonEnum(valueField: 'platform')
enum AppPlatform {
  @JsonValue(1)
  web,
  @JsonValue(2)
  android,
  @JsonValue(3)
  ios,
  @JsonValue(4)
  other,
}

extension AppPlatformExtension on AppPlatform {
  AppPlatform get appPlatform {
    if (Platform.isAndroid) {
      return AppPlatform.android;
    } else if (Platform.isIOS) {
      return AppPlatform.ios;
    } else {
      return AppPlatform.other;
    }
  }
}
