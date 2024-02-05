import 'package:flutter/material.dart';
import '../init/constants/widget_constants.dart';

enum ButtonSize { large, medium, small }

extension ButtonSizeExtension on ButtonSize {
  Size getValue() {
    switch (this) {
      case ButtonSize.large:
        return const Size(
            WidgetConstants.buttonWidthHigh, WidgetConstants.buttonHeightHigh);
      case ButtonSize.medium:
        return const Size(WidgetConstants.buttonWidthMedium,
            WidgetConstants.buttonHeightMedium);
      case ButtonSize.small:
        return const Size(
            WidgetConstants.buttonWidthLow, WidgetConstants.buttonHeightLow);
    }
  }
}