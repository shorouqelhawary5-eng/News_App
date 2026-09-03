import 'package:flutter/material.dart';
import 'package:news_app/apis/api_services.dart';
import 'package:news_app/apis/artical_response/article.dart';
import 'package:news_app/apis/sources_response/source.dart';

class ArticalViewModel extends ChangeNotifier {
  List<Article> articles = [];
  bool isLoading = false;
  String errorMessage = '';

  Future<void> loadArticles(Source source) async {
    isLoading = true;
    notifyListeners();
    articles = await ApiServices.getArticles(source);
    isLoading = false;
    notifyListeners();
  }
}
