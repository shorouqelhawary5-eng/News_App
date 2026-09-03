import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:news_app/apis/artical_response/article.dart';
import 'package:news_app/apis/artical_response/articles_response.dart';
import 'package:news_app/apis/sources_response/source.dart';
import 'package:news_app/apis/sources_response/sources_response.dart';
import 'package:news_app/models/category_models.dart';

class ApiServices {
  static String baseUrl = 'newsapi.org';
  static String apiKey = '1157f65ef17442179e4b433ac4061fec';
  static String sourceEndpoint = '/v2/top-headlines/sources';
  static String articalEndpoint = '/v2/everything';

  static Future<List<Source>> getSources(CategoryModels category) async {
    Uri url = Uri.https(baseUrl, sourceEndpoint, {
      'apiKey': apiKey,
      'category': category.id,
    });
    http.Response servierResponse = await http.get(url);

    var json = jsonDecode(servierResponse.body);
    SourcesResponse sourcesResponse = SourcesResponse.fromJson(json);
    return sourcesResponse.sources!;
  }

  static Future<List<Article>> getArticles(Source source) async {
    Uri url = Uri.https(baseUrl, articalEndpoint, {
      'apiKey': apiKey,
      'sources': source.id,
    });
    http.Response articalResponse = await http.get(url);
    var json = jsonDecode(articalResponse.body);
    ArticlesResponse articlesResponse = ArticlesResponse.fromJson(json);
    return articlesResponse.articles!;
  }
}
