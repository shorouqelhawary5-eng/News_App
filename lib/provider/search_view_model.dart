import 'package:flutter/material.dart';
import 'package:news_app/data/apis/artical_response/article.dart';
import 'package:news_app/data/apis/result.dart';
import 'package:news_app/data/repositry/search/search_repository.dart';

class SearchViewModel extends ChangeNotifier {
  final SearchRepository searchRepository;
  SearchViewModel({required this.searchRepository});

  List<Article> articles = [];
  bool isLoading = false;
  String? errorMessage;

  void searchArticles(String query) async {
    if (query.trim().isEmpty) {
      articles = [];
      errorMessage = null;
      isLoading = false;
      notifyListeners();
      return;
    }

    isLoading = true;
    errorMessage = null;
    notifyListeners();

    var result = await searchRepository.searchArticles(query);

    isLoading = false;

    if (result is Success) {
      articles = (result).data as List<Article>;
      errorMessage = null;
    } else if (result is ServerError) {
      errorMessage = result.message;
      articles = [];
    } else if (result is NetworkError) {
      errorMessage = result.message;
      articles = [];
    }

    notifyListeners();
  }
}
