import 'package:flutter/material.dart';
import 'package:constructo/config/themes/text.dart';

import 'colors.dart';

export "colors.dart";
export "text.dart";

class Themes {
  static final _light = ThemeData(
    brightness: Brightness.light,
    primaryColor: AppColors.primary,
    colorScheme: const ColorScheme.light(primary: AppColors.primary, brightness: Brightness.light),
    textTheme: lightTextTheme,
    primaryTextTheme: Typography(platform: TargetPlatform.iOS).black,
    inputDecorationTheme: InputDecorationTheme(
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(6),
      ),
      contentPadding: const EdgeInsets.symmetric(vertical: 20, horizontal: 17),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: ButtonStyle(
        padding: MaterialStateProperty.all<EdgeInsets>(
          const EdgeInsets.symmetric(vertical: 20, horizontal: 17),
        ),
        backgroundColor: MaterialStateProperty.all<Color>(Colors.black),
        foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
      ),
    ),
  );

  static final _dark = ThemeData(
    brightness: Brightness.dark,
    primaryColor: AppColors.primary,
    colorScheme: const ColorScheme.light(primary: AppColors.primary, brightness: Brightness.dark),
    textTheme: darkTextTheme,
  );

  static Map<String, ThemeData> list = {
    "light": _light,
    "dark": _dark,
  };
}
