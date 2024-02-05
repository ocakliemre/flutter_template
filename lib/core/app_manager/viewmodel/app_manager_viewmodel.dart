import 'dart:async';
import 'package:flutter/material.dart';
import 'package:package_info_plus/package_info_plus.dart';
import '../../base/viewmodel/base_viewmodel.dart';
import '../../enums/app_enums.dart';
import '../../init/constants/app_constants.dart';
import '../../utility/device_helper.dart';
import '../model/settings_model.dart';
import '../repository/app_manager_repository.dart';
import '../service/app_manager_service_interface.dart';

class AppManagerViewModel extends BaseViewModel implements IAppManagerService {
  late final AppManagerRepository _appManagerRepository;

  AppMode _appMode = AppConstants.appMode;
  int appBuildNumber = 0;
  String appVersion = '';
  String deviceId = '';

  AppManagerViewModel() {
    _appManagerRepository = AppManagerRepository();
    getSettingsFromDevice();
  }

  bool get debugShowCheckedModeBanner =>
      appMode != AppMode.release ? true : false;

  AppMode get appMode => _appMode;

  set appMode(AppMode value) {
    _appMode = value;
    AppConstants.appMode = value;
    notifyListeners();
  }

  @override
  Future<SettingsModel?> getSettingsFromDevice() async {
    viewState = ViewState.loading;
    final result = await _appManagerRepository.getSettingsFromDevice();

    viewState = ViewState.loaded;

    return result;
  }

  @override
  Future<void> saveSettings(SettingsModel settingsModel) async {
    viewState = ViewState.loading;
    await _appManagerRepository.saveSettings(settingsModel);
    viewState = ViewState.loaded;
  }

  Future<void> getAppInfo() async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();

    try {
      appVersion = packageInfo.version;
      appBuildNumber = int.tryParse(packageInfo.buildNumber) ?? 0;
      deviceId = await DeviceHelper.instance.getDeviceId;
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  @override
  void applyFilter(BuildContext context) {}

  @override
  void applySearch(String value) {}

  @override
  void clearFilter() {}

  @override
  FutureOr<void> init() {}
}
