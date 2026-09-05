import 'package:news_app/data/apis/result.dart';
import 'package:news_app/data/apis/sources_response/source.dart';
import 'package:news_app/data/data_services/artical/artical_data_source.dart';
import 'package:news_app/data/repositry/artical/artical_repositry.dart';

class ArticalRepositryImp implements ArticalRepository {
  ArticalDataSource articalDataSource;
  ArticalRepositryImp({required this.articalDataSource});
  @override
  Future<Result> getArticals(Source source) async {
    return await articalDataSource.getArticals(source);
  }
}
