import 'dart:async';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import '../../../../core/init/constants/widget_constants.dart';
import '../../../core/extensions/context_extension.dart';
import '../../../../core/init/language/locale_keys.g.dart';
import '../../../../core/extensions/string_extension.dart';
import '../../../core/widgets/button_group_widget.dart';
import '../../../core/widgets/custom_dialog_widget.dart';
import '../../../locator.dart';
import '../../base/view/base_view.dart';
import '../../init/constants/app_constants.dart';
import '../../logger/logger_mixin.dart';
import '../../navigator/app_router.dart';
import '../../utility/view_helper.dart';
import '../model/user_model.dart';
import '../viewmodel/authentication_viewmodel.dart';

class AuthenticationView extends StatefulWidget {
  const AuthenticationView({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  State<AuthenticationView> createState() => _AuthenticationViewState();
}

class _AuthenticationViewState extends State<AuthenticationView>
    with LoggerViewMixin, ViewHelper {
  @override
  Widget build(BuildContext context) {
    return BaseView(
        viewModelBuilder: (_) => locator<AuthenticationViewModel>(),
        builder: _buildScreen);
  }

  @override
  void initState() {
    super.initState();

    ///Kullanıcı aksiyonu algılandığında oturum süresini arttırabilmek için
    ///bu hareketleri aşağıdaki şekilde takip ediyoruz.
    GestureBinding.instance.pointerRouter
        .addGlobalRoute(_globalUserInteractionHandler);

    checkSessionExpiration.resume();
  }

  @override
  void dispose() {
    try {
      GestureBinding.instance.pointerRouter
          .removeGlobalRoute(_globalUserInteractionHandler);
      // ignore: empty_catches
    } catch (e) {}

    checkSessionExpiration.pause();
    super.dispose();
  }

  Widget _buildScreen(
    BuildContext context,
    AuthenticationViewModel authenticationViewModel,
  ) {
    return widget.child;
  }

  ///Kullanıcı hareketi algılandığında aşağıdaki işlemler gerçekleştiriliyor.
  ///
  _globalUserInteractionHandler(PointerEvent event) {
    final authManager = locator<AuthenticationViewModel>();
    if (authManager.isAuthenticated) {
      authManager.extendSessionDuration();
    }
  }

  ///Oturum süresi belirtilen kadar azaldığında ekrana süreyi uzatma diyaloğu gösterir.
  ///
  bool _dialogActive = false;
  late final StreamSubscription checkSessionExpiration = Stream.periodic(
    const Duration(seconds: 10),
    (computationCount) {},
  ).listen((event) async {
    final authenticationViewmodel = locator<AuthenticationViewModel>();
    final UserModel? signedUser = await authenticationViewmodel.getSignedUser();

    if (authenticationViewmodel.isAuthenticated) {
      await authenticationViewmodel.getRemainingTime(signedUser).then((value) {
        if (value.inSeconds <= AppConstants.sessionExpiryDialogDuration) {
          if (!_dialogActive) {
            _dialogActive = true;

            showCounterDialog(
                mainContext: context,
                authenticationViewModel: authenticationViewmodel);
          }
        }
      });
    } else {
      checkSessionExpiration.pause();
    }
  });

  showCounterDialog({
    required BuildContext mainContext,
    required AuthenticationViewModel authenticationViewModel,
  }) {
    return showDialog(
      context: mainContext,
      builder: (context) {
        return StreamBuilder(
          stream:
              countdownStream.call(AppConstants.sessionExpiryDialogDuration),
          builder: (context, snapshot) {
            int counterValue =
                snapshot.data ?? AppConstants.sessionExpiryDialogDuration;

            if (snapshot.data == 0) {
              counterDialogExitFunction();
            }

            return CustomAlertDialog(
              title: AlertDialogTitleType.alert.string!,
              customButtons: [
                ButtonGroupWidget(
                  primaryButtonText:
                      LocaleKeys.authentication_extendTheTimeLabelText.locale,
                  onPressedPrimary: counterDialogExtendFunction,
                  secondaryButtonText:
                      LocaleKeys.authentication_exitLabelText.locale,
                  secondaryisOutlined: false,
                  onPressedSecondary: counterDialogExitFunction,
                ),
              ],
              buttonText: '$counterValue',
              children: [
                buildCounterDialogBody(context, counterValue),
              ],
            );
          },
        );
      },
    );
  }

  Column buildCounterDialogBody(
    BuildContext context,
    int counterValue,
  ) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          textAlign: TextAlign.center,
          LocaleKeys.authentication_counterDialogBodyLabelText.locale,
        ),
        buildCounterCircularWidget(context, counterValue)
      ],
    );
  }

  Container buildCounterCircularWidget(
    BuildContext context,
    int counterValue,
  ) {
    return Container(
      width: 50,
      height: 50,
      margin: const EdgeInsets.all(WidgetConstants.padding1),
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(
            width: 3,
            color: context.appTheme().secondaryColor,
          )),
      child: Center(
        child: Text(
          '$counterValue',
          style: context.appTheme().authenticationTextStyle,
        ),
      ),
    );
  }

  counterDialogExtendFunction() {
    locator<AppRouter>().pop();
    _dialogActive = false;
    locator<AuthenticationViewModel>().extendSessionDuration();
  }

  counterDialogExitFunction() {
    locator<AppRouter>().pop();
    _dialogActive = false;
    locator<AppRouter>().replace(const LoginRoute());
  }

  Stream<int> countdownStream(int countDownValue) async* {
    while (countDownValue > 0) {
      countDownValue -= 1;
      await Future.delayed(const Duration(seconds: 1));

      yield countDownValue;
    }
  }
}
