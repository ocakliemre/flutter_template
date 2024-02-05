import 'package:flutter/material.dart';
import '../../core/extensions/context_extension.dart';
import '../../core/extensions/string_extension.dart';
import '../init/constants/color_constants.dart';
import '../init/constants/widget_constants.dart';
import '../init/language/locale_keys.g.dart';
import 'button_group_widget.dart';

enum AlertDialogTitleType {
  success,
  failed,
  alert,
  info,
  confirmation,
}

enum DialogButtonType { ok, back }

extension EDialogTitleExtension on AlertDialogTitleType {
  String? get string {
    switch (this) {
      case AlertDialogTitleType.success:
        return LocaleKeys.alertdialog_dialogTitleSuccess.locale;
      case AlertDialogTitleType.failed:
        return LocaleKeys.alertdialog_dialogTitleFailed.locale;
      case AlertDialogTitleType.alert:
        return LocaleKeys.alertdialog_dialogTitleAlert.locale;
      case AlertDialogTitleType.info:
        return LocaleKeys.alertdialog_dialogTitleInfo.locale;
        case AlertDialogTitleType.confirmation:
        return LocaleKeys.alertdialog_dialogTitleConfirmation.locale;
      default:
        {
          return null;
        }
    }
  }
}

extension EDialogButtonExtension on DialogButtonType {
  String get string {
    switch (this) {
      case DialogButtonType.ok:
        return LocaleKeys.common_okButtonText.locale;
      case DialogButtonType.back:
        return LocaleKeys.common_backButtonText.locale;
      default:
        {
          return LocaleKeys.common_okButtonText.locale;
        }
    }
  }
}

Future<dynamic> customDialogWidget({
  Key? snackBarKey,
  required BuildContext context,
  AlertDialogTitleType? eTitle,
  String title = '',
  String description = '',
  String? buttonText,
  DialogButtonType? buttonType,
  bool buttonEnabled = true,
  bool showDefaultButton = true,
  VoidCallback? onPressed,
  List<Widget>? children,
  Widget? customButton,
  ChangeNotifier? viewmodel,
  bool? barrierDismissible,
  bool? canBack,
  WillPopCallback? onWillPop,
}) {
  return showDialog(
      context: context,
      useRootNavigator: false,
      barrierDismissible: barrierDismissible ?? true,
      builder: (BuildContext context) {
        return WillPopScope(
          onWillPop: onWillPop ??
              () {
                return Future.value(canBack ?? true);
              },
          child: StatefulBuilder(
            builder: (context, setState) {
              return CustomAlertDialog(
                key: snackBarKey,
                buttonEnabled: buttonEnabled,
                onPressed: onPressed,
                showDefaultButton: showDefaultButton,
                buttonText: buttonText ??
                    (buttonType?.string ?? DialogButtonType.ok.string),
                context: context,
                color: ColorConstants.primaryColor,
                title: eTitle?.string ?? title,
                description: description,
                customButtons: customButton == null ? null : [customButton],
                children: children,
              );
            },
          ),
        );
      });
}

class CustomAlertDialog extends StatefulWidget {
  final BuildContext? context;
  final Color? color;
  final String title;
  final String? description;
  final String buttonText;
  final List<Widget>? children;
  final bool buttonEnabled;
  final bool? showDefaultButton;
  final VoidCallback? onPressed;
  final List<Widget>? customButtons;
  const CustomAlertDialog({
    super.key,
    this.color,
    required this.title,
    this.description,
    this.context,
    required this.buttonText,
    this.children,
    this.buttonEnabled = true,
    this.onPressed,
    this.showDefaultButton,
    this.customButtons,
  });

  @override
  State<CustomAlertDialog> createState() => _CustomAlertDialogState();
}

class _CustomAlertDialogState extends State<CustomAlertDialog> {
  @override
  Widget build(BuildContext context) {
    final List<Widget> widgets = [
      Column(
        children: widget.children ??
            [
              Padding(
                padding: const EdgeInsets.all(WidgetConstants.padding1),
                child: Text(
                  widget.description ?? '',
                  textAlign: TextAlign.center,
                ),
              )
            ],
      )
    ];

    return Container(
      color: ColorConstants.transparent,
      height: context.dynamicHeight(1),
      width: context.dynamicWidth(1),
      child: Dialog(
        backgroundColor: ColorConstants.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              buildHeaderText(context),
              Padding(
                padding: const EdgeInsets.only(
                  right: WidgetConstants.padding2,
                  left: WidgetConstants.padding2,
                  bottom: WidgetConstants.padding2,
                ),
                child: Column(
                  children: widgets +
                      [
                        Column(
                          mainAxisSize: MainAxisSize.min,
                          children: (widget.customButtons ??
                              [
                                Visibility(
                                  visible: widget.showDefaultButton ?? true,
                                  child: buildButton(
                                    context: context,
                                    onPressed: widget.buttonEnabled
                                        ? (widget.onPressed ?? goBack(context))
                                        : null,
                                    buttonText: widget.buttonText,
                                  ),
                                )
                              ]),
                        ),
                      ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildButton({
    required BuildContext context,
    required VoidCallback? onPressed,
    required String buttonText,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: ButtonGroupWidget(
        onPressedPrimary: onPressed,
        primaryButtonText: buttonText,
      ),
    );
  }

  Widget buildHeaderText(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        bottom: WidgetConstants.padding5,
      ),
      child: Container(
        height: 50,
        decoration: const BoxDecoration(
          color: ColorConstants.primaryColor,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10), topRight: Radius.circular(10)),
        ),
        child: Center(
          child: Text(
            widget.title,
            textAlign: TextAlign.center,
            style: context.appTheme().alertDialogHeaderTextStyle,
          ),
        ),
      ),
    );
  }

  VoidCallback? goBack(BuildContext context) {
    return (() {
      Navigator.pop(context);
    });
  }
}
