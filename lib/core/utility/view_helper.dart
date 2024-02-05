import 'package:flutter/material.dart';
import '../app_manager/view/app_manager_view.dart';
import '../init/constants/app_constants.dart';
import '../widgets/button_group_widget.dart';
import '../widgets/custom_dialog_widget.dart';

mixin ViewHelper {
  void showSnackBarMessage({
    Key? snackBarKey,
    GlobalKey<ScaffoldState>? scaffoldKey,
    String? message,
    Duration? duration,
  }) {
    scaffoldKey ??= AppManagerView.scaffoldKey;
    if (scaffoldKey.currentContext == null) {
      return;
    }
    ScaffoldMessenger.of(scaffoldKey.currentContext!).showSnackBar(
      SnackBar(
        backgroundColor: Colors.black,
        duration: duration ?? AppConstants.snackBarDurationMid,
        content: Text(message ?? ''),
        showCloseIcon: true,
        behavior: SnackBarBehavior.floating,
        margin: const EdgeInsets.only(bottom: 10, right: 10, left: 10),
        padding: const EdgeInsets.only(
            right: 5.0, left: 15.0, bottom: 8.0, top: 8.0),
        closeIconColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0),
        ),
      ),
    );
  }

  Future<dynamic>? showCustomDialog({
    Key? snackBarKey,
    Key? key,
    GlobalKey<ScaffoldState>? scaffoldKey,
    AlertDialogTitleType? dialogTitleType,
    String title = '',
    String description = "",
    String? buttonText,
    DialogButtonType? buttonType,
    bool buttonEnabled = true,
    bool showDefaultButton = true,
    VoidCallback? onPressed,
    List<Widget>? children,
    ButtonGroupWidget? customButtons,
    ChangeNotifier? viewmodel,
    bool? canBack,
    WillPopCallback? onWillPop,
  }) {
    scaffoldKey ??= AppManagerView.scaffoldKey;

    if (scaffoldKey.currentContext != null) {
      return customDialogWidget(
        snackBarKey: snackBarKey,
        viewmodel: viewmodel,
        canBack: canBack,
        barrierDismissible: canBack,
        context: scaffoldKey.currentContext!,
        eTitle: dialogTitleType,
        title: title,
        description: description,
        buttonText: buttonText,
        buttonType: buttonType,
        buttonEnabled: buttonEnabled,
        showDefaultButton: showDefaultButton,
        onPressed: onPressed,
        children: children,
        customButton: customButtons,
        onWillPop: onWillPop,
      );
    }
    return null;
  }
}

class ViewHelperClass with ViewHelper {}
