import 'package:flutter/material.dart';

import '../../main.dart';
import 'app_colors.dart';

class AppTheme {
  AppTheme._();
  static Duration hideDuration() => const Duration(milliseconds: 300);
  static OutlineInputBorder buildOutlineInputBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: const BorderSide(
        width: 2,
      ),
    );
  }

  static TextStyle smallTitleTextStyle() =>
      const TextStyle(fontSize: 22, color: AppColors.kPrimaryColor, fontWeight: FontWeight.bold);

  static TextStyle appbarTitleStyle() => const TextStyle(fontSize: 22, fontWeight: FontWeight.w600);

  static ThemeData getTheme(bool isDark) {
    return ThemeData(
      brightness: isDark ? Brightness.dark : Brightness.light,
      scaffoldBackgroundColor: isDark ? AppColors.kPrimaryColor : Colors.white,
      colorScheme: ColorScheme.fromSeed(
          seedColor: AppColors.kPrimaryColor,
          brightness: isDark ? Brightness.dark : Brightness.light),
      useMaterial3: true,
      buttonTheme: ButtonThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: AppColors.kPrimaryColor,
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
          backgroundColor: WidgetStateProperty.all<Color>(AppColors.kPrimaryColor),
        ),
      ),
    );
  }

  static bool isDark() {
    return Theme.of(navKey.currentContext!).brightness == Brightness.dark;
  }
}
