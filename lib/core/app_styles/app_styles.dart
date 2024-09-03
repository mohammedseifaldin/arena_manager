import 'package:flutter/material.dart';

import '../../main.dart';
import 'app_colors.dart';

class AppStyles {
  AppStyles._();
  static Duration hideDuration() => const Duration(milliseconds: 300);
  static OutlineInputBorder buildOutlineInputBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(15),
      borderSide: const BorderSide(
        color: Colors.grey,
        width: 1,
      ),
    );
  }

  static TextStyle smallTitleTextStyle() => const TextStyle(
        fontSize: 22,
        color: AppColors.kPrimaryColor,
        fontWeight: FontWeight.bold,
      );

  static TextStyle appbarTitleStyle() => const TextStyle(fontSize: 22, fontWeight: FontWeight.w600);

  static ThemeData getTheme() {
    return ThemeData(
      colorScheme: ColorScheme.fromSeed(seedColor: AppColors.kPrimaryColor),
    );
  }

  static bool isDark() {
    return Theme.of(navKey.currentContext!).brightness == Brightness.dark;
  }
}
