import 'package:news_app/data/apis/result.dart';

abstract class SearchDataSource {
  Future<Result> searchArticles(String query);
}
