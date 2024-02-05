import 'package:flutter/material.dart';
import '../../../core/extensions/context_extension.dart';

extension TextExtension on Text {
  Text scaleScreen(BuildContext context) {
    return Text(
      data.toString(),
      style: style,
      softWrap: softWrap,
      key: key,
      textAlign: textAlign,
      overflow: overflow,
      locale: locale,
      maxLines: maxLines,
      semanticsLabel: semanticsLabel,
      strutStyle: strutStyle,
      textDirection: textDirection,
      textHeightBehavior: textHeightBehavior,
      textWidthBasis: textWidthBasis,
      textScaleFactor: context.appTheme().deviceScreenScale(
          scaleFactor: context.appTheme().textScaleFactorFromFontSize(
              fontSize: style!.fontSize!, context: context),
          context: context),
    );
  }
}
