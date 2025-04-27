import 'package:flutter/material.dart';
import 'package:smart_shoes/ApplicationLayer/Presentation/_Resources/ColorManager.dart';
import 'package:smart_shoes/ApplicationLayer/Presentation/_Resources/FontManager.dart';
import 'package:smart_shoes/ApplicationLayer/Presentation/_Resources/StyleManager.dart';
import 'package:smart_shoes/ApplicationLayer/Presentation/_Resources/ValueManager.dart';

class ThemeManager{
  static ThemeData lightThemeData = ThemeData(
    colorScheme: ColorManager.lightColorScheme,
    fontFamily: FontManager.fontFamily,
    appBarTheme: _appBarTheme,
    buttonTheme: _buttonTheme,
    elevatedButtonTheme: _elevatedButtonTheme,
    textTheme: _textTheme,
    inputDecorationTheme: _textFormFieldTheme,
    cardTheme: _cardTheme
  );

  static final AppBarTheme _appBarTheme = AppBarTheme(
    shadowColor: Colors.transparent,
    titleTextStyle: TextStyleManager.getMediumStyle()
  );

  static const CardTheme _cardTheme = CardTheme(elevation: AppSizeManager.s4);

  static const ButtonThemeData _buttonTheme = ButtonThemeData(
    shape: RoundedRectangleBorder());

  static final ElevatedButtonThemeData _elevatedButtonTheme =
  ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      shadowColor: Colors.transparent,
      minimumSize: const Size(149, 39),
      padding: const EdgeInsets.symmetric(
        vertical: AppPaddingManager.p7,
        horizontal: AppPaddingManager.p18
      ),
      elevation: AppSizeManager.s16,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppSizeManager.s16)
      ),
      textStyle: TextStyleManager.getRegularStyle(size: FontSizeManager.s21,color: ColorManager.onPrimary)
    )
  );

  static final TextTheme _textTheme = TextTheme(
    bodySmall: TextStyleManager.getBoldStyle(),
    bodyMedium: TextStyleManager.getRegularStyle(),
    headlineSmall: TextStyleManager.getItalicStyle(TextStyleManager.getRegularStyle(
      size: FontSizeManager.s21,
      color: ColorManager.primary
    )),
    headlineMedium: TextStyleManager.getMediumStyle(color: ColorManager.primary)
  );


  static final InputDecorationTheme _textFormFieldTheme = InputDecorationTheme(
    isDense: true,
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(AppSizeManager.s16)
    ),
    contentPadding:const EdgeInsets.symmetric(horizontal: AppPaddingManager.p18,vertical: 11),
    fillColor: Colors.transparent,
    hintStyle: TextStyleManager.getRegularStyle(),
    labelStyle: TextStyleManager.getItalicStyle(TextStyleManager.getRegularStyle(color: ColorManager.secondary)),
      errorStyle: TextStyleManager.getRegularStyle(color: ColorManager.error),
      enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppSizeManager.s16),
          borderSide: const BorderSide(color: ColorManager.secondary)),
      focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppSizeManager.s16),
          borderSide: const BorderSide(color: ColorManager.primary)),
      errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppSizeManager.s16),
          borderSide: const BorderSide(color: ColorManager.errorContainer)),
      focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppSizeManager.s16),
          borderSide: const BorderSide(color: ColorManager.tertiary)
      )

  );



}