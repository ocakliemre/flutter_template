import '../model/settings_model.dart';

abstract class IAppManagerService {
  Future<SettingsModel?> getSettingsFromDevice();
  Future<void> saveSettings(SettingsModel settingsModel);
}
