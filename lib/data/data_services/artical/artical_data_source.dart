import 'package:news_app/data/apis/result.dart';
import 'package:news_app/data/apis/sources_response/source.dart';

abstract class ArticalDataSource {
  Future<Result> getArticals(Source source);
}
