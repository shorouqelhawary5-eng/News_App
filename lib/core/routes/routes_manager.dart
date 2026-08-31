import 'package:flutter/material.dart';
import 'package:news_app/feature/home.dart';

abstract class RoutesManager {
  static const String home = '/home';

  static Map<String, WidgetBuilder> get routes {
    return {RoutesManager.home: (context) => HomeScreen()};
  }
}
