import 'package:news_app/data/apis/result.dart';
import 'package:news_app/data/data_services/source/source_data_source.dart';
import 'package:news_app/data/repositry/source/source_repositry.dart';
import 'package:news_app/models/category_models.dart';

class SourceRepositoryImp implements SourceRepository {
  SourceDataSource sourceDataSource;
  SourceRepositoryImp({required this.sourceDataSource});
  @override
  Future<Result> getSources(CategoryModels category) async {
    return await sourceDataSource.getSources(category);
  }
}
