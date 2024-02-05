import '../../cache/hive/constants/hive_constants.dart';
import '../../cache/hive/interface/ICacheManager.dart';
import '../cache/settings_cache_manager.dart';
import '../model/settings_model.dart';
import 'app_manager_service_interface.dart';

class AppManagerService implements IAppManagerService {
  late final ICacheManager<SettingsModel> _settingsCacheManager;

  AppManagerService() {
    _settingsCacheManager =
        SettingsCacheManager(HiveConstants.settingsModelKey);
  }

  @override
  Future<SettingsModel?> getSettingsFromDevice() async {
    return await _settingsCacheManager.getValue(HiveConstants.settingsModelKey);
  }

  @override
  Future<void> saveSettings(SettingsModel settingsModel) async {
    await _settingsCacheManager.putItem(
        HiveConstants.settingsModelKey, settingsModel);
  }
}
