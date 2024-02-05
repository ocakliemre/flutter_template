import 'dart:async';
import 'package:easy_localization/easy_localization.dart';
import 'package:easy_logger/easy_logger.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:logger/logger.dart';
import '../../locator.dart';
import 'environment/app_environment.dart';

@immutable
final class ApplicationInitialize {
  Future<void> init() async {
    await runZonedGuarded(
      () async {
        await _initialize();
      },
      (error, stack) {
        //TODO: Error log eklenecek
      },
    );
  }

  Future<void> _initialize() async {
    //get_it
    setupLocator();

    //Environemnt
    AppEnvironment.general();

    //Hive
    Hive.initFlutter();

    //Localization
    await EasyLocalization.ensureInitialized();
    EasyLocalization.logger.enableLevels = [
      LevelMessages.error,
    ];

    //Firebase
    _initFirebaseServices();

    //UI
    await SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
  }

  Future<void> _initFirebaseServices() async {
    await Firebase.initializeApp();
    FlutterError.onError = (errorDetails) {
      //TODO: Log servisi bağlanacak. Şuanda sadece crashlytics bağlı.
      FirebaseCrashlytics.instance.recordFlutterFatalError(errorDetails);
      Logger().e(errorDetails.exceptionAsString(),
          stackTrace: errorDetails.stack); //TODO: Log katmanına taşınacak.
    };

    PlatformDispatcher.instance.onError = (error, stack) {
      FirebaseCrashlytics.instance.recordError(error, stack, fatal: true);
      return true;
    };
  }
}
