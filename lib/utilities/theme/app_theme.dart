import 'package:flutter/material.dart';
import 'package:splendlens_fe/utilities/utilities.dart';

class AppTheme implements BaseTheme {
  @override
  ThemeData get appTheme => ThemeData();

  @override
  TextStyle get blackBoldNormalStyle => const TextStyle(
        color: Colors.black,
        fontWeight: FontWeight.bold,
      );

  @override
  TextStyle get blackBoldSubheadlineStyle => const TextStyle(
      fontWeight: FontWeight.bold, fontSize: 16.0, color: Colors.black);

  @override
  TextStyle get subheadlineStyle =>
      const TextStyle(fontSize: 16.0, color: Colors.white);

  @override
  TextStyle get blackNormalStyle => const TextStyle(fontSize: 12.0);

  @override
  TextStyle get boldHeadlineStyle => const TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 24,
      );

  @override
  TextStyle get whiteBoldHeadlineStyle => const TextStyle(
      fontWeight: FontWeight.bold, fontSize: 24, color: Colors.white);

  @override
  TextStyle get formFieldTextStyle => const TextStyle();

  @override
  TextStyle get whiteSubheadlineStyle => const TextStyle(
      fontSize: 18.0, color: Colors.white54, fontWeight: FontWeight.w900);

  @override
  TextStyle get whiteNormallineStyle =>
      const TextStyle(fontSize: 12, color: Colors.white);

  @override
  Color get darkBlue => Colors.blue.shade900;

  @override
  Color get darkGrey => const Color(0xFF696969);

  @override
  Color get lightBlue => Colors.blue.shade300;

  @override
  Color get white => Colors.white;

  @override
  Color get black => Colors.black;
  @override
  Color get lightGrey => Colors.grey.shade200;

  @override
  Color get blue => Colors.blue.shade800;
  
}
