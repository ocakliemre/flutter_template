import 'package:hive_flutter/adapters.dart';
import '../../cache/hive/constants/hive_constants.dart';
import '../../cache/hive/interface/ICacheManager.dart';
import '../model/settings_model.dart';

class SettingsCacheManager extends ICacheManager<SettingsModel> {
  SettingsCacheManager(super.key);

  @override
  Future<void> putItems(List<SettingsModel> items) {
    throw UnimplementedError();
  }

  @override
  void registerAdapters() {
    if (!Hive.isAdapterRegistered(HiveConstants.settingsModelId)) {
      Hive.registerAdapter(SettingsModelAdapter());
    }
  }
}
