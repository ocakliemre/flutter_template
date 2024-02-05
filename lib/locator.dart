import 'package:get_it/get_it.dart';
import 'app/auth/login/viewmodel/login_viewmodel.dart';
import 'core/app_manager/viewmodel/app_manager_viewmodel.dart';
import 'core/init/theme/viewmodel/theme_viewmodel.dart';
import 'core/navigator/app_router.dart';

GetIt locator = GetIt.I;

void setupLocator() {
  locator.registerSingleton<AppRouter>(AppRouter());
  locator.registerLazySingleton(() => ThemeViewModel());
  locator.registerLazySingleton(() => AppManagerViewModel());
  locator.registerLazySingleton(() => LoginViewModel());
}
