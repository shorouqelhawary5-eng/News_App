import 'package:flutter/material.dart';
import 'package:news_app/core/resources/colors_manager.dart';

abstract class ThemeManager {
  static ThemeData LightTheme = ThemeData(
    scaffoldBackgroundColor: ColorsManager.black,
  );
  static ThemeData DarkTheme = ThemeData(
    scaffoldBackgroundColor: ColorsManager.white,
  );
}
