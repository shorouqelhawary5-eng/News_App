import 'package:news_app/data/apis/result.dart';
import 'package:news_app/data/apis/sources_response/source.dart';
import 'package:news_app/data/data_services/artical_data_source.dart';

abstract class ArticalRepository implements ArticalDataSource {
  @override
  Future<Result> getArticals(Source source);
}
