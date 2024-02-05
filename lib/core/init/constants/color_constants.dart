
import 'package:flutter/material.dart';

class ColorConstants {
  static const Color primaryColor = steelGray;
  static const Color secondaryColor = Color(0xffea7d41); //yuchisoft;
  static const Color thirdColor = ColorConstants.white;
  static const Color white = Color(0xFFffffff);
  static const Color icyLilac = Color(0xFFe4e9f7);
  static const Color drWhite = Color(0xFFfafafa);
  static const Color transparent = Color(0x00000000);
  static const Color transparentWhite = Colors.white70;
  static const Color steelGray = Color(0xFF201E2A);
  static const Color softGrey = Color(0xFF85838a);
  static const Color transparentGrey = Color(0x4A9E9E9E);
  static const Color blueGray = Color(0xFF607D8B);
  static const Color tahitiGold = Color(0xFFd76e2e);
  static const Color black = Color(0xFF000000);
  static const Color wildSand = Color(0xfff5f5f5);
  static const Color gallery = Color(0xfff0f0f0);
  static const Color yuchi = Color(0xffE76E2D);
  static const Color pickledBlueWood = Color(0xff344757);
  static const Color eastBay = Color(0xff454184);
  static const Color haveLockBlue = Color(0xff6790de);
  static const Color sinbad = Color(0xff9ecdca);
  static const Color cameo = Color(0xffdbad93);
  static const Color newYorkPink = Color(0xffd0717e);
  static const Color coralTree = Color(0xffa5697f);
  static const Color smoky = Color(0xff645575);
  static const Color westBay = Color(0xff435576);
  static const Color heliotrope = Color(0xffa76fff);
  static const Color turbo = Color(0xfff4e300);
  static const Color riptide = Color(0xff87e4e5);
  static const Color downy = Color(0xff66cbcd);
  static const Color royalBlue = Color(0xff3b5ae9);
  static const Color sushi = Color(0xff7cb832);
  static const Color koromiko = Color(0xfffdbb5b);
  static const Color ecstasy = Color(0xfff67521);
  static const Color cornflowerBlue = Color(0xff7461f8);
  static const Color frenchRose = Color(0xffee4e8a);
  static const Color curiousBlue = Color(0xff1a91d1);
  static const Color shamrock = Color(0xff23d291);
  static const Color persianBlue = Color(0xff2c1dec);
  static const Color whiteLilac = Color(0xfff6f7fb);
  static const Color selago = Color(0xfffbfbfe);
  static const Color stratos = Color(0xff03014a);
}

class UserStaticstisColor {
  static const List<Color> colorList = [
    Color(0xd2b7e65b),
    Color(0xffed4f81),
    Color(0xff933af2),
    Color(0xff4f9fed),
    Color(0xffdfff1c),
  ];

  static Color getNextColor({required int elementIndex}) {
    final result = colorList[elementIndex % colorList.length];
    return result;
  }
}