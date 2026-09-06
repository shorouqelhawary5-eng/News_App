import 'package:flutter/material.dart';
import 'package:news_app/feature/views/category_view/category_view.dart';
import 'package:news_app/feature/views/sources_view/sources_view.dart';
import 'package:news_app/models/category_models.dart';

class HomeScreenProvider extends ChangeNotifier {
  Widget view = CategoryView();
  String? selectedCategory;

  void goToSources(CategoryModels category) {
    selectedCategory = category.title;
    view = SourcesView(category: category);
    notifyListeners();
  }

  void goToCategories() {
    selectedCategory = null;
    view = CategoryView();
    notifyListeners();
  }
}
