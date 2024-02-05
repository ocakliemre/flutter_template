import 'package:flutter/material.dart';
import '../../../core/extensions/context_extension.dart';
import '../../init/constants/color_constants.dart';
import '../../init/constants/widget_constants.dart';

class MiniButtonWidget extends StatelessWidget {
  const MiniButtonWidget({
    super.key,
    this.onTap,
    required this.text,
    this.showBorder = true,
    this.textStyle,
    this.icon,
    this.iconFirst = true,
    this.iconSize = 14,
  });

  final VoidCallback? onTap;
  final String text;
  final TextStyle? textStyle;
  final bool showBorder;
  final IconData? icon;
  final bool? iconFirst;
  final double? iconSize;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: ColorConstants.transparent,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(WidgetConstants.borderRadius4),
          side: BorderSide(
            color: showBorder == true
                ? ColorConstants.coralTree
                : ColorConstants.transparent,
          )),
      child: InkWell(
          borderRadius: BorderRadius.circular(WidgetConstants.borderRadius4),
          onTap: onTap,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              // spacing: 5.0,
              // runAlignment: WrapAlignment.center,
              // crossAxisAlignment: WrapCrossAlignment.center,
              // alignment: WrapAlignment.center,
              // direction: Axis.horizontal,
              // clipBehavior: Clip.none,
              children: [
                (iconFirst ?? true) ? buildIcon(context) : buildText(context),
                (iconFirst ?? true) ? buildText(context) : buildIcon(context),
              ],
            ),
          )),
    );
  }

  Widget buildIcon(BuildContext context) {
    return Flexible(child: icon == null
        ? Container()
        : Icon(
      icon,
      size: iconSize,
      color: textStyle?.color ??
          context.appTheme().miniButtonTextStyle.color,
    ));
  }

  Widget buildText(BuildContext context) {
    return Flexible(
      child: Text(
        text,
        style: textStyle ?? context.appTheme().miniButtonTextStyle,
        overflow: TextOverflow.visible,
        softWrap: false,
        textAlign: TextAlign.start,
      ),
    );
  }
}
