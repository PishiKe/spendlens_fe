import 'package:flutter/material.dart';

abstract class BaseTheme {
  ThemeData get appTheme;

  // Text
  TextStyle get blackBoldNormalStyle;
  TextStyle get blackBoldSubheadlineStyle;
  TextStyle get subheadlineStyle;
  TextStyle get boldHeadlineStyle;
  TextStyle get formFieldTextStyle;
  TextStyle get blackNormalStyle;
  TextStyle get whiteBoldHeadlineStyle;
  TextStyle get whiteSubheadlineStyle;
  TextStyle get whiteNormallineStyle;

  // Colors
  Color get white;
  Color get black;
  Color get lightGrey;
  Color get darkGrey;
  Color get lightBlue;
  Color get blue;
  Color get darkBlue;
}
