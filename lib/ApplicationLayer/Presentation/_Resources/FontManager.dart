import 'package:flutter/material.dart';

mixin FontManager{
  static const String fontFamily = "Roboto";
}

mixin FontWeightManager{
  static const FontWeight regularW = FontWeight.w400;
  static const FontWeight mediumW = FontWeight.w500;
  static const FontWeight italicW = regularW;
  static const FontWeight boldW = FontWeight.w700;
}


mixin FontSizeManager {
  static const double s7 = 7;
  static const double s10 = 10;
  static const double s14 = 14;
  static const double s21 = 21;
  static const double s26 = 26;
  static const double s36 = 36;

}
