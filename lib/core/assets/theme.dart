import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
      backgroundColor: CustomColors.primary,
      textStyle: CustomTypography.buttonTextWhite,
      minimumSize: Size(double.infinity, 70.h),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30.w),
      ),
    ),
  ),
);
