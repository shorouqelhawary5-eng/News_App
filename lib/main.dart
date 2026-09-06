import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:news_app/config/theme_manger.dart';
import 'package:news_app/core/routes/routes_manager.dart';
import 'package:news_app/l10n/app_localizations.dart';
import 'package:news_app/provider/home_screen_provider.dart';
import 'package:news_app/provider/language_provider.dart';
import 'package:news_app/provider/theme_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<HomeScreenProvider>(
          create: (context) => HomeScreenProvider(),
        ),
        ChangeNotifierProvider<ThemeProvider>(
          create: (context) => ThemeProvider(),
        ),
        ChangeNotifierProvider<LanguageProvider>(
          create: (context) => LanguageProvider(),
        ),
      ],
      child: const NewsApp(),
    ),
  );
}

class NewsApp extends StatelessWidget {
  const NewsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilPlusInit(
      designSize: const Size(393, 852),
      minTextAdapt: true,
      splitScreenMode: true,
      autoRebuild: false,
      builder: (context, child) {
        return Consumer<ThemeProvider>(
          builder: (context, themeProvider, child) {
            return Consumer<LanguageProvider>(
              builder: (context, languageProvider, child) {
                return MaterialApp(
                  debugShowCheckedModeBanner: false,
                  initialRoute: RoutesManager.home,
                  routes: RoutesManager.routes,
                  theme: ThemeManager.lightTheme,
                  darkTheme: ThemeManager.darkTheme,
                  themeMode: themeProvider.themeMode,
                  localizationsDelegates: const [
                    AppLocalizations.delegate,
                    GlobalMaterialLocalizations.delegate,
                    GlobalWidgetsLocalizations.delegate,
                    GlobalCupertinoLocalizations.delegate,
                  ],
                  supportedLocales: const [Locale('en'), Locale('ar')],
                  locale: Locale(languageProvider.language),
                );
              },
            );
          },
        );
      },
    );
  }
}
