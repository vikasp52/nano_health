import 'package:flutter/material.dart';
import 'package:nano_health/core/assets/assets.dart';

final lightTheme = ThemeData(
  scaffoldBackgroundColor: CustomColors.whiteSmoke,
  primaryColor: CustomColors.primary,
  colorScheme: const ColorScheme.light(
    primary: CustomColors.primary,
  ),
  cardTheme: CardTheme(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      color: CustomColors.white),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: CustomColors.secondary,
      textStyle: CustomTypography.buttonTextWhite,
      minimumSize: const Size(double.infinity, 48),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
    ),
  ),
);
