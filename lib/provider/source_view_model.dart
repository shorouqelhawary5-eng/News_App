import 'package:flutter/material.dart';
import 'package:news_app/apis/api_services.dart';
import 'package:news_app/apis/result.dart';
import 'package:news_app/apis/sources_response/source.dart';
import 'package:news_app/models/category_models.dart';

class SourceViewModel extends ChangeNotifier {
  List<Source> sources = [];
  bool isLoading = false;
  String errorMessage = '';

  Future<void> loadSources(CategoryModels category) async {
    isLoading = true;
    errorMessage = '';
    notifyListeners();
    var result = await ApiServices.getSources(category);
    isLoading = false;
    notifyListeners();

    switch (result) {
      case Success():
        sources = result.data;

      case ServerError():
        errorMessage = result.message;

      case NetworkError():
        errorMessage = result.message;
    }
    notifyListeners();
  }
}
