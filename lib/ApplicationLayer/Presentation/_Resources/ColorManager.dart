import 'package:flutter/material.dart';

mixin ColorManager{

  static const Color primary= Color(0xFF006590);
  static const Color onPrimary= Color(0xFFDCE7F1);
  static const Color primaryContainer = Color(0xFFB7CEDB);
  static const Color secondary= Color(0xFF71787E);
  static const Color surface= Color(0xFFD8E7EF);
  static const Color onSurface = Color(0xFF001E2F);

  static const Color onSurfaceVariant1LGray= Color(0xFF41484D);
  static const Color onSurfaceVariant1LGrayOpacity= Color(0x3341484D);
  static const Color onSurfaceVariant2LGreen= Color(0xFF27E291);
  static const Color onSurfaceVariant2LGreenOpacity= Color(0x3427E291);
  static const Color onSurfaceVariant2DGreen= Color(0xFF005231);
  static const Color onSurfaceVariant3LYellow= Color(0xFFFDBA4B);
  static const Color onSurfaceVariant3LYellowOpacity= Color(0x33FDBA4B);
  static const Color onSurfaceVariant3DYellow= Color(0xFF614000);
  static const Color onSurfaceVariant4LRed= Color(0xFFDE3730);
  static const Color onSurfaceVariant4LRedOpacity= Color(0x33DE3730);
  static const Color onSurfaceVariant4DRed= Color(0xFF93000A);
  static const Color onSurfaceVariant5LBlue = Color(0xFF55B4ED);

  // unused colors
  static const Color background= Color(0xFFD8E7EF);
  static const Color onBackground= Color(0xFF001E2F);
  static const Color onPrimaryContainer = Color(0xFF001E2E);
  static const Color onSecondary= Color(0xFFFFFFFF);
  static const Color secondaryContainer= Color(0xFFE9DDFF);
  static const Color onSecondaryContainer= Color(0xFF22005D);
  static const Color tertiary= Color(0xFF99405F);
  static const Color onTertiary= Color(0xFFFFFFFF);
  static const Color tertiaryContainer= Color(0xFFFFD9E2);
  static const Color onTertiaryContainer= Color(0xFF3F001C);
  static const Color error= Color(0xFFBA1A1A);
  static const Color onError= Color(0xFFFFFFFF);
  static const Color errorContainer= Color(0xCCBA1A1A);
  static const Color onErrorContainer= Color(0xFF410002);
  static const Color surfaceVariant= Color(0xFFDDE3EA);
  static const Color outline= Color(0xFF71787E);
  static const Color shadow= Color(0xFF000000);
  static const Color inverseSurface= Color(0xFF00344D);
  static const Color onInverseSurface= Color(0xFFE5F2FF);
  static const Color inversePrimary= Color(0x7787CEFF);
  static const Color surfaceTint= Color(0xFF006590);







  static const ColorScheme lightColorScheme = ColorScheme(
      brightness: Brightness.light, primary: primary, onPrimary: onPrimary, secondary: secondary, onSecondary: onSecondary, error: error, onError: onError, background: background, onBackground: onBackground, surface: surface, onSurface: onSurface);

}