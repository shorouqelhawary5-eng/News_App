import 'package:news_app/data/apis/result.dart';
import 'package:news_app/models/category_models.dart';

abstract class SourceDataSource {
  Future<Result> getSources(CategoryModels category);
}
