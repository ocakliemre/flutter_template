import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../core/extensions/context_extension.dart';
import '../../../core/init/constants/color_constants.dart';
import '../../../core/init/theme/base/base_theme.dart';

class LightTheme extends BaseTheme {
  static LightTheme? _instance;

  static LightTheme? get instance {
    if (_instance != null) return _instance;
    _instance = LightTheme._init();
    return _instance;
  }

  LightTheme._init();

  @override
  ThemeData get themeData => ThemeData.light().copyWith(
        colorScheme: ThemeData.light().colorScheme.copyWith(
              primary: primaryColor,
              secondary: secondaryColor,
            ),
        useMaterial3: true,
      );

  @override
  Color get primaryColor => ColorConstants.primaryColor;

  @override
  Color get secondaryColor => ColorConstants.secondaryColor;

  @override
  Color get thirdColor => ColorConstants.thirdColor;

  @override
  TextStyle get largeButtonLightTextStyle => GoogleFonts.roboto(
        fontSize: 14,
        fontWeight: FontWeight.bold,
        color: ColorConstants.steelGray,
      );

  @override
  TextStyle get largeButtonDarkTextStyle =>
      largeButtonLightTextStyle.copyWith(color: ColorConstants.white);

  @override
  TextStyle get textFieldHeaderTextStyle => GoogleFonts.roboto(
        fontSize: 12,
        fontWeight: FontWeight.bold,
        color: ColorConstants.steelGray,
      );

  @override
  TextStyle get appbarTitleTextStyle => GoogleFonts.roboto(
        fontSize: 18,
        fontWeight: FontWeight.bold,
        color: ColorConstants.white,
      );

  @override
  TextStyle get appbarSubTitleTextStyle => GoogleFonts.roboto(
        fontSize: 13,
        fontWeight: FontWeight.w400,
        color: ColorConstants.softGrey,
      );

  @override
  TextStyle get miniButtonTextStyle => GoogleFonts.roboto(
        fontSize: 11,
        fontWeight: FontWeight.w600,
        color: ColorConstants.white,
      );

  @override
  TextStyle get filterTitleTextStyle => GoogleFonts.roboto(
      color: ColorConstants.softGrey,
      fontSize: 14,
      fontWeight: FontWeight.normal);

  @override
  TextStyle get appbarUserStaticsTitleTextStyle => GoogleFonts.roboto(
        fontSize: 13,
        fontWeight: FontWeight.w400,
        color: ColorConstants.white,
      );

  @override
  TextStyle get appbarUserStaticsValueTextStyle =>
      appbarUserStaticsTitleTextStyle.copyWith(color: ColorConstants.white);

  @override
  TextStyle get walkthroughTitleTextStyle => GoogleFonts.roboto(
        fontSize: 20,
        fontWeight: FontWeight.w600,
        color: ColorConstants.pickledBlueWood,
      );

  @override
  TextStyle get walkthroughDescriptionTextStyle => GoogleFonts.roboto(
        fontSize: 14,
        fontWeight: FontWeight.w400,
        color: ColorConstants.pickledBlueWood,
      );

  @override
  TextStyle get mainMenuItemTextStyle => GoogleFonts.roboto(
      textStyle: const TextStyle(
          height: 1.3,
          color: ColorConstants.westBay,
          fontSize: 12,
          fontWeight: FontWeight.w500));

  @override
  TextStyle get profileViewLabelTextStyle => GoogleFonts.roboto(
      textStyle: const TextStyle(
          color: ColorConstants.steelGray,
          fontSize: 13,
          fontWeight: FontWeight.w600));

  @override
  TextStyle get saveButtonTextStyle => GoogleFonts.roboto(
      textStyle: const TextStyle(
          color: ColorConstants.white,
          fontSize: 13,
          fontWeight: FontWeight.w600));

  @override
  TextStyle get addWorkButtonTextStyle => GoogleFonts.roboto(
      textStyle: const TextStyle(
          color: ColorConstants.white,
          fontSize: 13,
          fontWeight: FontWeight.w600));

  @override
  TextStyle get alertDialogHeaderTextStyle => GoogleFonts.roboto(
        textStyle: const TextStyle(
          color: ColorConstants.white,
          fontSize: 15,
          fontWeight: FontWeight.bold,
        ),
      );

  @override
  TextStyle get itemCardWidgetTextStyle => GoogleFonts.roboto(
        textStyle: const TextStyle(
            color: ColorConstants.white,
            fontSize: 10,
            fontWeight: FontWeight.w600),
      );
  @override
  TextStyle get bottomSheetModalTextStyle => GoogleFonts.roboto(
        textStyle: const TextStyle(
            color: ColorConstants.smoky,
            fontSize: 11,
            fontWeight: FontWeight.w600),
      );
  @override
  TextStyle get itemCardWidgetTitleTextStyle => GoogleFonts.roboto(
        textStyle: const TextStyle(
            color: ColorConstants.steelGray,
            fontSize: 13,
            fontWeight: FontWeight.w600),
      );
  @override
  TextStyle get itemCardWidgetValueTextStyle => GoogleFonts.roboto(
        textStyle: const TextStyle(
            color: ColorConstants.steelGray,
            fontSize: 13,
            fontWeight: FontWeight.w600),
      );
  @override
  TextStyle get defaultAlertDialogTextStyle => GoogleFonts.roboto(
        textStyle: const TextStyle(
          color: ColorConstants.steelGray,
          fontSize: 12,
          fontWeight: FontWeight.w600,
        ),
      );

  @override
  TextStyle get defaultBoldTextStyle => GoogleFonts.roboto(
        textStyle: const TextStyle(
          color: ColorConstants.steelGray,
          fontSize: 12,
          fontWeight: FontWeight.bold,
        ),
      );

  @override
  TextStyle get defaultThinTextStyle => GoogleFonts.roboto(
        textStyle: const TextStyle(
          color: ColorConstants.steelGray,
          fontSize: 12,
          fontWeight: FontWeight.w400,
        ),
      );

  @override
  TextStyle get groupPlanningDefaultTextStyle => GoogleFonts.roboto(
        textStyle: const TextStyle(
          color: ColorConstants.steelGray,
          fontSize: 11,
          fontWeight: FontWeight.bold,
        ),
      );

  @override
  TextStyle get chatThinTextStyle => GoogleFonts.roboto(
        textStyle: TextStyle(
          color: ColorConstants.steelGray.withOpacity(0.5),
          fontSize: 12,
          fontWeight: FontWeight.w600,
        ),
      );

  @override
  TextStyle get chatBoldTextStyle => GoogleFonts.roboto(
        textStyle: const TextStyle(
          color: ColorConstants.steelGray,
          fontSize: 14,
          fontWeight: FontWeight.w600,
        ),
      );

  @override
  TextStyle get chatTitleTextStyle => GoogleFonts.roboto(
        textStyle: TextStyle(
          color: ColorConstants.steelGray.withOpacity(0.7),
          fontSize: 14,
          fontWeight: FontWeight.w400,
        ),
      );

  @override
  TextStyle get customerTextStyle => GoogleFonts.roboto(
        textStyle: const TextStyle(
          color: ColorConstants.black,
          fontSize: 20,
          fontWeight: FontWeight.w500,
        ),
      );

  @override
  Color get mainMenuItemBackgroundColor => ColorConstants.white;

  @override
  Color get mainMenuItemShadowColor => ColorConstants.transparentWhite;

  @override
  Color get loginTransparentContainerColor =>
      ColorConstants.transparentWhite.withOpacity(0.8);

  @override
  double deviceScreenScale(
      {required double scaleFactor, required BuildContext context}) {
    return context.dynamicWidth(scaleFactor);
  }

  @override
  double textScaleFactorFromFontSize(
      {required double fontSize, required BuildContext context}) {
    switch (fontSize.toInt()) {
      default:
        {
          return 0.0022;
        }
    }
  }

  @override
  TextStyle get buttonGroupPrimaryTextStyle => GoogleFonts.roboto(
        textStyle: const TextStyle(
            color: ColorConstants.white,
            fontSize: 11,
            fontWeight: FontWeight.w600),
      );

  @override
  TextStyle get buttonGroupSecondaryTextStyle =>
      buttonGroupPrimaryTextStyle.copyWith();

  @override
  TextStyle get bottomSheetTitleTextStyle => GoogleFonts.roboto(
        fontSize: 20,
        fontWeight: FontWeight.w600,
        color: ColorConstants.steelGray,
      );

  @override
  TextStyle get formHeaderTextStyle => GoogleFonts.roboto(
        fontSize: 12,
        fontWeight: FontWeight.bold,
        color: ColorConstants.steelGray,
      );

  @override
  TextStyle get formErrorTextStyle => GoogleFonts.roboto(
        fontSize: 11,
        fontWeight: FontWeight.bold,
        color: ColorConstants.tahitiGold,
      );

  @override
  TextStyle get formInputValueTextStyle => GoogleFonts.roboto(
        textStyle: const TextStyle(
            color: ColorConstants.steelGray,
            fontSize: 13,
            fontWeight: FontWeight.w600),
      );

  @override
  TextStyle get authenticationTextStyle => GoogleFonts.roboto(
      color: ColorConstants.secondaryColor,
      fontSize: 20,
      fontWeight: FontWeight.w700);

  @override
  Color get bottomNavigationBackgroundColor => ColorConstants.primaryColor;

  @override
  Color get bottomNavigationSelectedItemColor => ColorConstants.white;

  @override
  Color get bottomNavigationUnSelectedItemColor => ColorConstants.softGrey;
}
