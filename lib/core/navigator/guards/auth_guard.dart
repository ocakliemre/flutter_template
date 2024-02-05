import 'package:auto_route/auto_route.dart';
import '../../../core/extensions/string_extension.dart';
import '../../../locator.dart';
import '../../auth_manager/viewmodel/authentication_viewmodel.dart';
import '../../init/language/locale_keys.g.dart';
import '../../utility/view_helper.dart';
import '../app_router.dart';

class AuthGuard extends AutoRouteGuard with ViewHelper {
  @override
  void onNavigation(NavigationResolver resolver, StackRouter router) {
    AuthenticationViewModel authenticationViewModel =
        locator<AuthenticationViewModel>();
    bool isResult = authenticationViewModel.isAuthenticated;
    if (isResult) {
      // Eğer kullanıcı oturumm açmışsa devam et.
      resolver.next(true);
    } else {
      // Eğer kullanıcı oturumm açmamışsa Login'e yönlendiriyoruz.
      router.replace(const LoginRoute());

      showSnackBarMessage(
        message: LocaleKeys.authentication_sessionExpired.locale,
      );
    }
  }
}
