import 'package:flutter/material.dart';

import 'package:news_app/data/apis/artical_response/article.dart';
import 'package:news_app/data/apis/result.dart';
import 'package:news_app/data/apis/sources_response/source.dart';
import 'package:news_app/data/repositry/artical_repositry_imp.dart';

class ArticalViewModel extends ChangeNotifier {
  List<Article> articles = [];
  bool isLoading = false;
  String errorMessage = '';
  ArticalRepositryImp articalRepositryImp;

  ArticalViewModel({required this.articalRepositryImp});

  Future<void> loadArticles(Source source) async {
    isLoading = true;
    errorMessage = '';
    notifyListeners();
    var result = await articalRepositryImp.getArticals(source);
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
