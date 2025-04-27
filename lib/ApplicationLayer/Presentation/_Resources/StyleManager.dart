import 'package:smart_shoes/ApplicationLayer/Presentation/_Resources/ColorManager.dart';

import 'FontManager.dart';
import 'package:flutter/material.dart';

class TextStyleManager {
  static TextStyle _getTextStyle(double size, FontWeight weight, Color color,
      {String family = FontManager.fontFamily}) {
    return TextStyle(
      fontFamily: family,
      fontSize: size,
      fontWeight: weight,
      color: color,
    );
  }

  static TextStyle getRegularStyle(
      {double size = FontSizeManager.s14,
      FontWeight weight = FontWeightManager.regularW,
      Color color = ColorManager.onSurface}) {
    return _getTextStyle(size, weight, color);
  }

  static TextStyle getItalicStyle(TextStyle style){
    return style.copyWith(fontStyle: FontStyle.italic);
  }

  static TextStyle getMediumStyle(
      {double size = FontSizeManager.s26,
      FontWeight weight = FontWeightManager.mediumW,
      Color color = ColorManager.onPrimary}) {
    return _getTextStyle(size, weight, color);
  }

  static TextStyle getBoldStyle(
      {double size = FontSizeManager.s10,
      FontWeight weight = FontWeightManager.boldW,
      Color color = ColorManager.onSurface}) {
    return _getTextStyle(size, weight, color);
  }
}
