import 'package:flutter/material.dart';
import '../../../core/extensions/context_extension.dart';
import '../init/constants/color_constants.dart';
import '../init/constants/widget_constants.dart';
import 'buttons/large_button.dart';

class ButtonGroupWidget extends StatelessWidget {
  const ButtonGroupWidget({
    super.key,
    required this.onPressedPrimary,
    this.primaryButtonText,
    this.onPressedSecondary,
    this.secondaryButtonText,
    this.secondaryBorderColor,
    this.wrapText = false,
    this.secondaryisOutlined = false,
    this.primaryisOutlined = false,
  });

  final VoidCallback? onPressedPrimary;
  final String? primaryButtonText;
  final VoidCallback? onPressedSecondary;
  final String? secondaryButtonText;
  final Color? secondaryBorderColor;
  final bool secondaryisOutlined;
  final bool primaryisOutlined;
  final bool wrapText;

  @override
  Widget build(BuildContext context) {
    return buildButtonGroup(context: context, buttons: buttons(context));
  }

  Widget buildButtonGroup({
    required BuildContext context,
    required List<Widget> buttons,
  }) {
    List<Widget> widgetList = [];
    for (var element in buttons) {
      widgetList.add(
        element,
      );
    }

    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: widgetList,
    );
  }

  List<Widget> buttons(BuildContext context) {
    return [
      buildButtonContainer(
        context: context,
        isVisible: secondaryButtonText == null ? false : true,
        button: LargeButton(
          text: secondaryButtonText.toString(),
          style: context.appTheme().buttonGroupSecondaryTextStyle,
          backgroundColor:
              ColorConstants.secondaryColor, //ColorConstants.smoky,
          isOutlined: secondaryisOutlined,
          onPressed: onPressedSecondary,
          wrapText: wrapText,
        ),
      ),
      Visibility(
        visible: secondaryButtonText == null ? false : true,
        child: const SizedBox(
          width: WidgetConstants.padding6,
        ),
      ),
      buildButtonContainer(
        context: context,
        isVisible: primaryButtonText == null ? false : true,
        button: LargeButton(
          text: primaryButtonText.toString(),
          style: context.appTheme().buttonGroupPrimaryTextStyle,
          backgroundColor:
              ColorConstants.primaryColor, //ColorConstants.newYorkPink,
          isOutlined: primaryisOutlined,
          onPressed: onPressedPrimary,
          wrapText: wrapText,
        ),
      ),
    ];
  }

  Visibility buildButtonContainer({
    required BuildContext context,
    required bool isVisible,
    required LargeButton button,
  }) {
    return Visibility(
      visible: isVisible,
      child: Expanded(
        child: SizedBox(
          height: WidgetConstants.buttonHeightMedium,
          child: button,
        ),
      ),
    );
  }
}
