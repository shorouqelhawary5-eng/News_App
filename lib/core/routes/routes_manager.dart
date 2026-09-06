import 'package:flutter/material.dart';
import 'package:news_app/data/apis/api_services.dart';
import 'package:news_app/data/data_services/search/search_api_data_source_imp.dart';
import 'package:news_app/data/repositry/search/search_repository_imp.dart';
import 'package:news_app/feature/home/home.dart';
import 'package:news_app/feature/search/search_screen.dart';
import 'package:news_app/provider/search_view_model.dart';
import 'package:provider/provider.dart';

abstract class RoutesManager {
  static const String home = '/home';
  static const String search = '/search';

  static Map<String, WidgetBuilder> get routes {
    return {
      RoutesManager.home: (context) => HomeScreen(),
      RoutesManager.search: (context) => ChangeNotifierProvider(
        create: (context) => SearchViewModel(
          searchRepository: SearchRepositoryImp(
            searchDataSource: SearchApiDataSourceImp(
              apiServices: ApiServices(),
            ),
          ),
        ),
        child: const SearchScreen(),
      ),
    };
  }
}
