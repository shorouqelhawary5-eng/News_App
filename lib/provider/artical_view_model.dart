import 'package:flutter/material.dart';
import 'package:news_app/apis/api_services.dart';
import 'package:news_app/apis/artical_response/article.dart';
import 'package:news_app/apis/result.dart';
import 'package:news_app/apis/sources_response/source.dart';

class ArticalViewModel extends ChangeNotifier {
  List<Article> articles = [];
  bool isLoading = false;
  String errorMessage = '';

  Future<void> loadArticles(Source source) async {
    isLoading = true;
    errorMessage = '';
    notifyListeners();
    var result = await ApiServices.getArticles(source);
    isLoading = false;
    notifyListeners();

    switch (result) {
      case Success():
        articles = result.data;

      case ServerError():
        errorMessage = result.message;

      case NetworkError():
        errorMessage = result.message;
    }
    notifyListeners();
  }
}
