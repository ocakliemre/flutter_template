import 'package:hive_flutter/adapters.dart';
import '../../cache/hive/constants/hive_constants.dart';

part 'settings_model.g.dart';

@HiveType(typeId: HiveConstants.settingsModelId)
class SettingsModel {
  @HiveField(0)
  String ip;
  @HiveField(1)
  String port;

  SettingsModel({
    required this.ip,
    required this.port,
  });
}
