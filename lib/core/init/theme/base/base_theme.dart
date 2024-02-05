import 'package:flutter/material.dart';

abstract class BaseTheme {
  ThemeData get themeData;
  Color get primaryColor;
  Color get secondaryColor;
  Color get thirdColor;
  TextStyle get largeButtonLightTextStyle;
  TextStyle get largeButtonDarkTextStyle;
  TextStyle get textFieldHeaderTextStyle;
  TextStyle get appbarTitleTextStyle;
  TextStyle get groupPlanningDefaultTextStyle;
  TextStyle get appbarSubTitleTextStyle;
  TextStyle get miniButtonTextStyle;
  TextStyle get filterTitleTextStyle;
  TextStyle get appbarUserStaticsTitleTextStyle;
  TextStyle get appbarUserStaticsValueTextStyle;
  TextStyle get walkthroughTitleTextStyle;
  TextStyle get walkthroughDescriptionTextStyle;
  TextStyle get mainMenuItemTextStyle;
  TextStyle get itemCardWidgetTextStyle;
  TextStyle get profileViewLabelTextStyle;
  TextStyle get addWorkButtonTextStyle;
  TextStyle get saveButtonTextStyle;
  TextStyle get alertDialogHeaderTextStyle;
  TextStyle get bottomSheetModalTextStyle;
  TextStyle get itemCardWidgetTitleTextStyle;
  TextStyle get itemCardWidgetValueTextStyle;
  TextStyle get defaultAlertDialogTextStyle;
  TextStyle get defaultBoldTextStyle;
  TextStyle get defaultThinTextStyle;
  TextStyle get chatThinTextStyle;
  TextStyle get chatBoldTextStyle;
  TextStyle get chatTitleTextStyle;
  TextStyle get customerTextStyle;
  Color get mainMenuItemBackgroundColor;
  Color get mainMenuItemShadowColor;
  Color get loginTransparentContainerColor;
  TextStyle get buttonGroupPrimaryTextStyle;
  TextStyle get buttonGroupSecondaryTextStyle;
  TextStyle get bottomSheetTitleTextStyle;
  double deviceScreenScale({
    required double scaleFactor,
    required BuildContext context,
  });
  double textScaleFactorFromFontSize({
    required double fontSize,
    required BuildContext context,
  });
  TextStyle get formHeaderTextStyle;
  TextStyle get formErrorTextStyle;
  TextStyle get formInputValueTextStyle;
  TextStyle get authenticationTextStyle;
  Color get bottomNavigationBackgroundColor;
  Color get bottomNavigationSelectedItemColor;
  Color get bottomNavigationUnSelectedItemColor;
}
