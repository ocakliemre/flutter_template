import 'package:flutter/material.dart'
    show BuildContext, Color, TextStyle, ThemeData;
import '../../../core/extensions/context_extension.dart';
import '../../../core/init/theme/base/base_theme.dart';

class DarkTheme extends BaseTheme {
  static DarkTheme? _instance;

  static DarkTheme? get instance {
    if (_instance != null) return _instance;
    _instance = DarkTheme._init();
    return _instance;
  }

  DarkTheme._init();

  @override
  TextStyle get largeButtonLightTextStyle => throw UnimplementedError();

  @override
  TextStyle get largeButtonDarkTextStyle => throw UnimplementedError();

  @override
  TextStyle get textFieldHeaderTextStyle => throw UnimplementedError();

  @override
  Color get primaryColor => throw UnimplementedError();

  @override
  Color get secondaryColor => throw UnimplementedError();

  @override
  Color get thirdColor => throw UnimplementedError();

  @override
  ThemeData get themeData => throw UnimplementedError();

  @override
  TextStyle get appbarTitleTextStyle => throw UnimplementedError();

  @override
  TextStyle get appbarSubTitleTextStyle => throw UnimplementedError();

  @override
  TextStyle get appbarUserStaticsTitleTextStyle => throw UnimplementedError();

  @override
  TextStyle get appbarUserStaticsValueTextStyle => throw UnimplementedError();

  @override
  TextStyle get walkthroughDescriptionTextStyle => throw UnimplementedError();

  @override
  TextStyle get walkthroughTitleTextStyle => throw UnimplementedError();

  @override
  TextStyle get mainMenuItemTextStyle => throw UnimplementedError();

  @override
  Color get mainMenuItemBackgroundColor => throw UnimplementedError();

  @override
  Color get mainMenuItemShadowColor => throw UnimplementedError();

  @override
  TextStyle get miniButtonTextStyle => throw UnimplementedError();

  @override
  Color get loginTransparentContainerColor => throw UnimplementedError();

  @override
  TextStyle get profileViewLabelTextStyle => throw UnimplementedError();

  @override
  TextStyle get saveButtonTextStyle => throw UnimplementedError();

  @override
  TextStyle get addWorkButtonTextStyle => throw UnimplementedError();

  @override
  TextStyle get alertDialogHeaderTextStyle => throw UnimplementedError();

  @override
  double deviceScreenScale(
      {required double scaleFactor, required BuildContext context}) {
    return context.dynamicWidth(scaleFactor);
  }

  @override
  double textScaleFactorFromFontSize(
      {required double fontSize, required BuildContext context}) {
    throw UnimplementedError();
  }

  @override
  TextStyle get itemCardWidgetTextStyle => throw UnimplementedError();

  @override
  TextStyle get bottomSheetModalTextStyle => throw UnimplementedError();

  @override
  TextStyle get itemCardWidgetTitleTextStyle => throw UnimplementedError();

  @override
  TextStyle get itemCardWidgetValueTextStyle => throw UnimplementedError();

  @override
  TextStyle get buttonGroupPrimaryTextStyle => throw UnimplementedError();

  @override
  TextStyle get buttonGroupSecondaryTextStyle => throw UnimplementedError();

  @override
  TextStyle get defaultAlertDialogTextStyle => throw UnimplementedError();

  @override
  TextStyle get defaultBoldTextStyle => throw UnimplementedError();

  @override
  TextStyle get defaultThinTextStyle => throw UnimplementedError();

  @override
  TextStyle get groupPlanningDefaultTextStyle => throw UnimplementedError();

  @override
  TextStyle get chatThinTextStyle => throw UnimplementedError();

  @override
  TextStyle get chatBoldTextStyle => throw UnimplementedError();

  @override
  TextStyle get chatTitleTextStyle => throw UnimplementedError();

  @override
  TextStyle get bottomSheetTitleTextStyle => throw UnimplementedError();

  @override
  TextStyle get filterTitleTextStyle => throw UnimplementedError();

  @override
  TextStyle get customerTextStyle => throw UnimplementedError();

  @override
  TextStyle get formHeaderTextStyle => throw UnimplementedError();

  @override
  TextStyle get formErrorTextStyle => throw UnimplementedError();

  @override
  TextStyle get formInputValueTextStyle => throw UnimplementedError();

  @override
  TextStyle get authenticationTextStyle => throw UnimplementedError();

  @override
  Color get bottomNavigationBackgroundColor => throw UnimplementedError();

  @override
  Color get bottomNavigationSelectedItemColor => throw UnimplementedError();

  @override
  Color get bottomNavigationUnSelectedItemColor => throw UnimplementedError();
}
