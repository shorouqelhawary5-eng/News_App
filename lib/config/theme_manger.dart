import 'package:flutter/material.dart';
import 'package:news_app/core/resources/colors_manager.dart';

abstract class ThemeManager {
  static ThemeData darkTheme = ThemeData(
    scaffoldBackgroundColor: ColorsManager.black,
    appBarTheme: const AppBarTheme(
      backgroundColor: ColorsManager.black,
      foregroundColor: ColorsManager.white,
      titleTextStyle: TextStyle(
        fontSize: 20,
        fontWeight: .w500,
        // color: ColorsManager.white,
      ),
    ),
    drawerTheme: const DrawerThemeData(backgroundColor: ColorsManager.black),

    textTheme: const TextTheme(
      headlineLarge: TextStyle(
        fontSize: 24,
        fontWeight: .w500,
        color: ColorsManager.white,
      ),

      titleLarge: TextStyle(
        fontSize: 16,
        fontWeight: .w700,
        color: ColorsManager.white,
      ),
      titleMedium: TextStyle(
        fontSize: 14,
        fontWeight: .w500,
        color: ColorsManager.white,
      ),

      labelSmall: TextStyle(
        fontSize: 12,
        fontWeight: .w500,
        color: ColorsManager.grayA0,
      ),
    ),
  );

  static ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: ColorsManager.black,
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.transparent,
      foregroundColor: ColorsManager.black,
      titleTextStyle: TextStyle(
        fontSize: 20,
        fontWeight: .w500,
        // color: ColorsManager.white,
      ),
    ),
    textTheme: const TextTheme(
      headlineLarge: TextStyle(
        fontSize: 24,
        fontWeight: .w500,
        color: ColorsManager.black,
      ),

      labelSmall: TextStyle(
        fontSize: 12,
        fontWeight: .w500,
        color: ColorsManager.grayA0,
      ),

      titleLarge: TextStyle(
        fontSize: 16,
        fontWeight: .w700,
        color: ColorsManager.white,
      ),

      titleMedium: TextStyle(
        fontSize: 14,
        fontWeight: .w500,
        color: ColorsManager.white,
      ),
    ),
  );
}
