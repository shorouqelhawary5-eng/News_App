import 'package:news_app/data/apis/api_services.dart';
import 'package:news_app/data/apis/result.dart';
import 'package:news_app/data/apis/sources_response/source.dart';
import 'package:news_app/data/data_services/artical_data_source.dart';

class ArticalApiDataSourceImp implements ArticalDataSource {
  ApiServices apiServices;
  ArticalApiDataSourceImp({required this.apiServices});

  @override
  Future<Result> getArticals(Source source) async {
    return await apiServices.getArticles(source);
  }
}
