// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'app_router.dart';

abstract class _$AppRouter extends RootStackRouter {
  // ignore: unused_element
  _$AppRouter({super.navigatorKey});

  @override
  final Map<String, PageFactory> pagesMap = {
    AppManagerRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: WrappedRoute(child: const AppManagerView()),
      );
    },
    LoginMainRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const LoginMainView(),
      );
    },
    LoginSettingsRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const LoginSettingsView(),
      );
    },
    LoginRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const LoginView(),
      );
    },
    MainRootRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const MainRootView(),
      );
    },
    SplashRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const SplashView(),
      );
    },
    WalkthroughRoute.name: (routeData) {
      final args = routeData.argsAs<WalkthroughRouteArgs>(
          orElse: () => const WalkthroughRouteArgs());
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: WalkthroughView(
          key: args.key,
          colorOff: args.colorOff,
        ),
      );
    },
  };
}

/// generated route for
/// [AppManagerView]
class AppManagerRoute extends PageRouteInfo<void> {
  const AppManagerRoute({List<PageRouteInfo>? children})
      : super(
          AppManagerRoute.name,
          initialChildren: children,
        );

  static const String name = 'AppManagerRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [LoginMainView]
class LoginMainRoute extends PageRouteInfo<void> {
  const LoginMainRoute({List<PageRouteInfo>? children})
      : super(
          LoginMainRoute.name,
          initialChildren: children,
        );

  static const String name = 'LoginMainRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [LoginSettingsView]
class LoginSettingsRoute extends PageRouteInfo<void> {
  const LoginSettingsRoute({List<PageRouteInfo>? children})
      : super(
          LoginSettingsRoute.name,
          initialChildren: children,
        );

  static const String name = 'LoginSettingsRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [LoginView]
class LoginRoute extends PageRouteInfo<void> {
  const LoginRoute({List<PageRouteInfo>? children})
      : super(
          LoginRoute.name,
          initialChildren: children,
        );

  static const String name = 'LoginRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [MainRootView]
class MainRootRoute extends PageRouteInfo<void> {
  const MainRootRoute({List<PageRouteInfo>? children})
      : super(
          MainRootRoute.name,
          initialChildren: children,
        );

  static const String name = 'MainRootRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [SplashView]
class SplashRoute extends PageRouteInfo<void> {
  const SplashRoute({List<PageRouteInfo>? children})
      : super(
          SplashRoute.name,
          initialChildren: children,
        );

  static const String name = 'SplashRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [WalkthroughView]
class WalkthroughRoute extends PageRouteInfo<WalkthroughRouteArgs> {
  WalkthroughRoute({
    Key? key,
    bool? colorOff = false,
    List<PageRouteInfo>? children,
  }) : super(
          WalkthroughRoute.name,
          args: WalkthroughRouteArgs(
            key: key,
            colorOff: colorOff,
          ),
          initialChildren: children,
        );

  static const String name = 'WalkthroughRoute';

  static const PageInfo<WalkthroughRouteArgs> page =
      PageInfo<WalkthroughRouteArgs>(name);
}

class WalkthroughRouteArgs {
  const WalkthroughRouteArgs({
    this.key,
    this.colorOff = false,
  });

  final Key? key;

  final bool? colorOff;

  @override
  String toString() {
    return 'WalkthroughRouteArgs{key: $key, colorOff: $colorOff}';
  }
}
