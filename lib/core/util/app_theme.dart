import 'package:flutter/material.dart';
import 'package:r5/core/util/app_color.dart';

ThemeData getThemeData(BuildContext context) {
  return ThemeData(
    inputDecorationTheme: const InputDecorationTheme(
      focusedBorder: InputBorder.none,
      enabledBorder: InputBorder.none,
      disabledBorder: InputBorder.none,
    ),
    appBarTheme: const AppBarTheme(color: AppColors.primary),
    scaffoldBackgroundColor: AppColors.primary,
  );
}
