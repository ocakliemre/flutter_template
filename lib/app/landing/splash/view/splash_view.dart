import 'package:flutter/material.dart';
import '../../../../app/landing/splash/viewmodel/splash_viewmodel.dart';
import '../../../../core/auth_manager/viewmodel/authentication_viewmodel.dart';
import '../../../../core/navigator/app_router.dart';
import '../../../../core/base/view/base_view.dart';
import '../../../../core/init/constants/asset_constants.dart';
import '../../../../core/init/constants/color_constants.dart';
import '../../../../core/logger/logger_mixin.dart';
import '../../../../core/permission_manager/permission_manager.dart';
import '../../../../locator.dart';
import '../../../../core/extensions/context_extension.dart';
import 'package:auto_route/auto_route.dart';

@RoutePage()
class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> with LoggerViewMixin {
  @override
  void initState() {
    super.initState();
    waitSplash();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      PermissionManager.instance.checkPermissions();
    });
  }

  @override
  Widget build(BuildContext context) {
    return BaseView(
        viewModelBuilder: (_) => locator<SplashViewModel>(),
        builder: _buildScreen);
  }

  Widget _buildScreen(BuildContext context, SplashViewModel splashViewModel) {
    {
      return Container(
        color: ColorConstants.white,
        child: Container(
          margin: EdgeInsets.all(context.dynamicWidth(0.1)),
          decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage(AssetConstants.appLogo)),
          ),
        ),
      );
    }
  }

  Future<void> checkAuth() async {
    AuthenticationViewModel authenticationViewModel =
        locator<AuthenticationViewModel>();

    await authenticationViewModel.getSignedUser().then((value) {
      if (authenticationViewModel.isAuthenticated) {
        context.replaceRoute(const MainRootRoute());
      } else {
        context.replaceRoute(WalkthroughRoute());
      }
    });
  }

  void waitSplash() {
    Future.delayed(const Duration(seconds: 2)).then((value) async {
      await checkAuth();
    });
  }
}
