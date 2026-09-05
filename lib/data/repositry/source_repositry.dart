import 'package:news_app/data/apis/result.dart';
import 'package:news_app/data/data_services/source_data_source.dart';
import 'package:news_app/models/category_models.dart';

abstract class SourceRepository implements SourceDataSource {
  @override
  Future<Result> getSources(CategoryModels category);
}
