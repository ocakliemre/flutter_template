import '../model/settings_model.dart';
import '../service/app_manager_service.dart';
import '../service/app_manager_service_interface.dart';

class AppManagerRepository implements IAppManagerService {
  late final AppManagerService _appManagerService;

  AppManagerRepository() {
    _appManagerService = AppManagerService();
  }

  @override
  Future<SettingsModel?> getSettingsFromDevice() async {
    return await _appManagerService.getSettingsFromDevice();
  }

  @override
  Future<void> saveSettings(SettingsModel settingsModel) async {
    await _appManagerService.saveSettings(settingsModel);
  }
}
