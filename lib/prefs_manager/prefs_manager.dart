import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PrefsManager {
  static const String _themeKey = 'theme';
  static const String _langKey = 'lang';

  static Future<void> saveTheme(ThemeMode newTheme) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    // إضافه await هنا لضمان اكتمال عملية الحفظ
    await prefs.setString(
      _themeKey,
      newTheme == ThemeMode.dark ? 'dark' : 'light',
    );
  }

  static Future<ThemeMode?> getTheme() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? mode = prefs.getString(_themeKey);
    if (mode == null) return null;

    return mode == 'dark' ? ThemeMode.dark : ThemeMode.light;
  }

  static Future<void> saveLanguage(String language) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_langKey, language);
  }

  static Future<String?> getLanguage() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_langKey);
  }
}
