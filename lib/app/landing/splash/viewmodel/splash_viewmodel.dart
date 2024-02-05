import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../../../core/base/viewmodel/base_viewmodel.dart';
import '../../../../core/init/constants/color_constants.dart';

class SplashViewModel extends BaseViewModel {
  @override
  FutureOr<void> init() {
    initUISettings();
  }

  void initUISettings() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: [
      SystemUiOverlay.bottom,
      SystemUiOverlay.top,
    ]);

    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: ColorConstants.transparent,
      statusBarBrightness: Brightness.dark,
      statusBarIconBrightness: Brightness.dark,
    ));

    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);
  }

  @override
  void clearFilter() {}

  @override
  void applyFilter(BuildContext context) {}

  @override
  void applySearch(String value) {}
}
