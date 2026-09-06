import 'package:news_app/data/apis/api_services.dart';
import 'package:news_app/data/apis/result.dart';
import 'package:news_app/data/data_services/source/source_data_source.dart';
import 'package:news_app/models/category_models.dart';

class SourceApiDataSourceImp implements SourceDataSource {
  ApiServices apiServices;
  SourceApiDataSourceImp({required this.apiServices});
  @override
  Future<Result> getSources(CategoryModels category) async {
    return await apiServices.getSources(category);
  }
}
