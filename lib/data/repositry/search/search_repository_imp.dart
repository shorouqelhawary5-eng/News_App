import 'package:news_app/data/apis/result.dart';
import 'package:news_app/data/data_services/search/search_data_source.dart';
import 'package:news_app/data/repositry/search/search_repository.dart';

class SearchRepositoryImp implements SearchRepository {
  final SearchDataSource searchDataSource;
  SearchRepositoryImp({required this.searchDataSource});

  @override
  Future<Result> searchArticles(String query, {int page = 1}) async {
    return await searchDataSource.searchArticles(query, page: page);
  }
}
