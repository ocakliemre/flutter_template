part of 'app_router.dart';


AutoRoute loginMainRoute = AutoRoute(
    page: LoginMainRoute.page, children: [loginRoute, loginSettingsRoute]);

AutoRoute loginRoute = AutoRoute(
  initial: true,
  page: LoginRoute.page,
);

AutoRoute loginSettingsRoute = AutoRoute(
  page: LoginSettingsRoute.page,
);

AutoRoute walkthroughRoute = AutoRoute(
  page: WalkthroughRoute.page,
);

AutoRoute splashRoute = AutoRoute(
  page: SplashRoute.page,
  path: '',
);
