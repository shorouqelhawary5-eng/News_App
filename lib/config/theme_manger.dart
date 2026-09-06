import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:news_app/core/resources/colors_manager.dart';

abstract class ThemeManager {
  static ThemeData darkTheme = ThemeData(
    scaffoldBackgroundColor: ColorsManager.black,
    colorScheme: const ColorScheme.dark(
      error: ColorsManager.error,
      errorContainer: ColorsManager.errorContainer,
      onErrorContainer: ColorsManager.white,
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.transparent,
      foregroundColor: ColorsManager.white,
      titleTextStyle: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
    ),
    drawerTheme: const DrawerThemeData(backgroundColor: ColorsManager.black),
    textTheme: const TextTheme(
      headlineLarge: TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.w500,
        color: ColorsManager.white,
      ),
      titleLarge: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w700,
        color: ColorsManager.white,
      ),
      titleMedium: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w500,
        color: ColorsManager.white,
      ),
      labelSmall: TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.w500,
        color: ColorsManager.grayA0,
      ),
      bodyMedium: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w500,
        color: ColorsManager.black,
      ),
    ),

    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.r),
        ),
        backgroundColor: ColorsManager.black,
        foregroundColor: ColorsManager.white,
        textStyle: const TextStyle(fontSize: 16),
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: BorderSide(color: ColorsManager.white, width: 1),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: BorderSide(color: ColorsManager.white, width: 1),
      ),

      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: BorderSide(color: ColorsManager.white, width: 1),
      ),
    ),
  );

  static ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: ColorsManager.white,
    colorScheme: const ColorScheme.light(
      error: ColorsManager.error,
      errorContainer: ColorsManager.errorContainer,
      onErrorContainer: ColorsManager.white,
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.transparent,
      foregroundColor: ColorsManager.black,
      titleTextStyle: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w500,
        color: ColorsManager.black,
      ),
    ),
    drawerTheme: const DrawerThemeData(backgroundColor: ColorsManager.black),
    textTheme: const TextTheme(
      headlineLarge: TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.w500,
        color: ColorsManager.black,
      ),
      labelSmall: TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.w500,
        color: ColorsManager.grayA0,
      ),
      titleLarge: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w700,
        color: ColorsManager.black,
      ),
      titleMedium: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w500,
        color: ColorsManager.black,
      ),
      bodyMedium: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w500,
        color: ColorsManager.white,
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.r),
        ),
        backgroundColor: ColorsManager.white,
        foregroundColor: ColorsManager.black,
        textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: BorderSide(color: ColorsManager.black, width: 1),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: BorderSide(color: ColorsManager.black, width: 1),
      ),

      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: BorderSide(color: ColorsManager.black, width: 1),
      ),
    ),
  );
}
