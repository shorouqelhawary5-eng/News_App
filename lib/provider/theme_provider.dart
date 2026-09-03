import 'package:flutter/material.dart';
import 'package:news_app/prefs_manager/prefs_manager.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeMode themeMode = ThemeMode.dark;

  ThemeProvider() {
    loadTheme();
  }

  void toDarkTheme() {
    themeMode = ThemeMode.dark;
    PrefsManager.saveTheme(ThemeMode.dark);
    notifyListeners();
  }

  void toLightTheme() {
    themeMode = ThemeMode.light;
    PrefsManager.saveTheme(ThemeMode.light);
    notifyListeners();
  }

  Future<void> loadTheme() async {
    ThemeMode? savedTheme = await PrefsManager.getTheme();
    if (savedTheme != null) {
      themeMode = savedTheme;
      notifyListeners();
    }
  }
}
