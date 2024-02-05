import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:provider/provider.dart';
import 'core/app_manager/viewmodel/app_manager_viewmodel.dart';
import 'core/auth_manager/viewmodel/authentication_viewmodel.dart';
import 'core/init/constants/app_constants.dart';
import 'core/init/language/language_manager.dart';
import 'core/init/theme/viewmodel/theme_viewmodel.dart';
import 'core/navigator/app_router.dart';
import 'locator.dart';
import 'package:firebase_core/firebase_core.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initApp();
  runApp(buildApp());
}

Future<void> initFirebaseServices() async {
  await Firebase.initializeApp();
}

MultiProvider buildApp() {
  return MultiProvider(
    providers: providers,
    child: EasyLocalization(
        supportedLocales: (LanguageManager.instance?.supportedLocales)!,
        path: AppConstants.localizationAssetPath,
        child: const MyApp()),
  );
}

get providers => [
      ChangeNotifierProvider<ThemeViewModel>(
          create: (context) => locator<ThemeViewModel>()),
      ChangeNotifierProvider<AppManagerViewModel>(
          create: (context) => locator<AppManagerViewModel>()),
      ChangeNotifierProvider<AuthenticationViewModel>(
          create: (context) => locator<AuthenticationViewModel>()),
    ];

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<AppManagerViewModel>(builder: (context, value, child) {
      return MaterialApp.router(
        routerConfig: locator<AppRouter>().config(),
        debugShowCheckedModeBanner: value.debugShowCheckedModeBanner,
        title: AppConstants.appName,
        supportedLocales: context.supportedLocales,
        localizationsDelegates: context.localizationDelegates,
        locale: context.locale,
        theme: ThemeViewModel.theme?.themeData,
      );
    });
  }
}

Future<void> initApp() async {
  //get_it
  setupLocator();

  //Hive
  Hive.initFlutter();

  //Localization
  await EasyLocalization.ensureInitialized();

  //Firebase
  initFirebaseServices();
}
