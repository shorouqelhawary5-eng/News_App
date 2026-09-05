import 'package:news_app/data/apis/result.dart';

abstract class SearchRepository {
  Future<Result> searchArticles(String query, {int page = 1});
}
