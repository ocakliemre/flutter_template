import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import '../../app/auth/login/view/login_settings_view.dart';
import '../../app/auth/login/view/login_view.dart';
import '../../app/landing/splash/view/splash_view.dart';
import '../../app/landing/walkthrough/view/walkthrough_view.dart';
import '../app_manager/view/app_manager_view.dart';
import 'empty_pages/empty_pages.dart';

part 'app_router.gr.dart';

part 'app_router_routes.dart';

@AutoRouterConfig(
  replaceInRouteName: 'View,Route',
)
class AppRouter extends _$AppRouter {
  @override
  RouteType get defaultRouteType => const RouteType.material();

  @override
  final List<AutoRoute> routes = [
    AutoRoute(
        page: AppManagerRoute.page,
        maintainState: true,
        path: '/',
        children: [
          splashRoute,
          walkthroughRoute,
          loginMainRoute,
        ]),
  ];
}
