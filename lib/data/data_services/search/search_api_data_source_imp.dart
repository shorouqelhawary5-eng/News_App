import 'package:news_app/data/apis/api_services.dart';
import 'package:news_app/data/apis/result.dart';
import 'package:news_app/data/data_services/search/search_data_source.dart';

class SearchApiDataSourceImp implements SearchDataSource {
  final ApiServices apiServices;
  SearchApiDataSourceImp({required this.apiServices});

  @override
  Future<Result> searchArticles(String query) async {
    return await apiServices.searchArticles(query);
  }
}
