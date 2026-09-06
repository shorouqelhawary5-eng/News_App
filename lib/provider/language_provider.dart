import 'package:flutter/material.dart';
import 'package:news_app/prefs_manager/prefs_manager.dart';

class LanguageProvider with ChangeNotifier {
  String language = 'en';

  LanguageProvider() {
    loadLanguage();
  }

  void toEnglish() {
    language = 'en';
    PrefsManager.saveLanguage(language);
    notifyListeners();
  }

  void toArabic() {
    language = 'ar';
    PrefsManager.saveLanguage(language);
    notifyListeners();
  }

  Future<void> loadLanguage() async {
    final savedLanguage = await PrefsManager.getLanguage();
    if (savedLanguage != null) {
      language = savedLanguage;
      notifyListeners();
    }
  }
}
