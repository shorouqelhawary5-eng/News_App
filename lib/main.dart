import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:news_app/config/theme_manger.dart';
import 'package:news_app/core/routes/routes_manager.dart';
import 'package:news_app/l10n/app_localizations.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilPlusInit(
      designSize: const Size(393, 852),
      minTextAdapt: true,
      splitScreenMode: true,
      autoRebuild: false,

      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          initialRoute: RoutesManager.home,
          routes: RoutesManager.routes,
          theme: ThemeManager.lightTheme,
          darkTheme: ThemeManager.darkTheme,
          themeMode: ThemeMode.dark,
          localizationsDelegates: [
            AppLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],

          supportedLocales: [
            Locale('en'), // English
            Locale('ar'), // Spanish
          ],
          locale: Locale("en"), // English
        );
      },
    );
  }
}
