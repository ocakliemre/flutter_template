import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
///Uygulamanın tamamını etkileyen değişiklikler bu bölümde yönetilmektedir.
///Örneğin: AppMode.debug-release durumu gibi.
///Bu view widget tree'de ilk sırada yer almaktadır.
@RoutePage()
class AppManagerView extends AutoRouter implements AutoRouteWrapper {
  const AppManagerView({super.key});
  static final GlobalKey<ScaffoldState> scaffoldKey =
      GlobalKey<ScaffoldState>();
  @override
  Widget wrappedRoute(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      key: scaffoldKey,
      body: this,
    );
  }
}
