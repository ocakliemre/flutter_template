import 'package:flutter_udid/flutter_udid.dart';
import 'package:battery_plus/battery_plus.dart';

class DeviceHelper {
  static final DeviceHelper _instance = DeviceHelper._init();
  static DeviceHelper get instance => _instance;
  DeviceHelper._init();

  Future<int> get getBatteryLevel async {
    late final int batteryLevel;

    try {
      batteryLevel = await Battery().batteryLevel;
    } catch (e) {
      batteryLevel = 0;
    }

    return batteryLevel;
  }

  Future<String> get getDeviceId async {
    return await FlutterUdid.udid;
  }
}
