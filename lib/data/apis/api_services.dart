import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:news_app/data/apis/artical_response/articles_response.dart';
import 'package:news_app/data/apis/result.dart';
import 'package:news_app/data/apis/sources_response/source.dart';
import 'package:news_app/data/apis/sources_response/sources_response.dart';
import 'package:news_app/models/category_models.dart';

class ApiServices {
  static String baseUrl = 'newsapi.org';
  static String apiKey = '1157f65ef17442179e4b433ac4061fec';
  static String sourceEndpoint = '/v2/top-headlines/sources';
  static String articalEndpoint = '/v2/everything';

  Future<Result> getSources(CategoryModels category) async {
    try {
      Uri url = Uri.https(baseUrl, sourceEndpoint, {
        'apiKey': apiKey,
        'category': category.id,
      });
      http.Response servierResponse = await http.get(url);

      var json = jsonDecode(servierResponse.body);
      SourcesResponse sourcesResponse = SourcesResponse.fromJson(json);
      if (sourcesResponse.status == 'error') {
        return ServerError(
          sourcesResponse.error!,
          sourcesResponse.errorCode ?? "",
        );
      } else {
        return Success(sourcesResponse.sources ?? []);
      }
    } catch (e) {
      if (e is SocketException) {
        return NetworkError("No Internet connection");
      } else if (e is TimeoutException) {
        return NetworkError("Connection timeout");
      } else {
        return NetworkError("Something went wrong. Please try again.");
      }
    }
  }

  Future<Result> getArticles(Source source) async {
    try {
      Uri url = Uri.https(baseUrl, articalEndpoint, {
        'apiKey': apiKey,
        'sources': source.id,
      });
      http.Response articalResponse = await http.get(url);

      var json = jsonDecode(articalResponse.body);
      ArticlesResponse articlesResponse = ArticlesResponse.fromJson(json);
      if (articlesResponse.status == 'error') {
        return ServerError(
          articlesResponse.message!,
          articlesResponse.code ?? "",
        );
      } else {
        return Success(articlesResponse.articles ?? []);
      }
    } catch (e) {
      if (e is SocketException) {
        return NetworkError("No Internet connection");
      } else if (e is TimeoutException) {
        return NetworkError("Connection timeout");
      } else {
        return NetworkError("Something went wrong. Please try again.");
      }
    }
  }

  Future<Result> searchArticles(String query) async {
    try {
      Uri url = Uri.https(baseUrl, articalEndpoint, {
        'apiKey': apiKey,
        'q': query,
      });

      http.Response response = await http.get(
        url,
        headers: {'User-Agent': 'Mozilla/5.0'},
      );

      var json = jsonDecode(response.body);
      ArticlesResponse articlesResponse = ArticlesResponse.fromJson(json);

      if (articlesResponse.status == 'error') {
        return ServerError(
          articlesResponse.message ?? "An error occurred",
          articlesResponse.code ?? "",
        );
      } else {
        return Success(articlesResponse.articles ?? []);
      }
    } catch (e) {
      if (e is SocketException) {
        return NetworkError("No Internet connection");
      } else if (e is TimeoutException) {
        return NetworkError("Connection timeout");
      } else {
        return NetworkError("Something went wrong. Please try again.");
      }
    }
  }

  // Future<Result> searchArticles(String query) async {
  //   try {
  //     Uri url = Uri.https(baseUrl, articalEndpoint, {
  //       'apiKey': apiKey,
  //       'q': query,
  //     });
  //     http.Response response = await http.get(url);

  //     var json = jsonDecode(response.body);
  //     ArticlesResponse articlesResponse = ArticlesResponse.fromJson(json);
  //     if (articlesResponse.status == 'error') {
  //       return ServerError(
  //         articlesResponse.message ?? "Error",
  //         articlesResponse.code ?? "",
  //       );
  //     } else {
  //       return Success(articlesResponse.articles ?? []);
  //     }
  //   } catch (e) {
  //     if (e is SocketException) {
  //       return NetworkError("No Internet connection");
  //     } else if (e is TimeoutException) {
  //       return NetworkError("Connection timeout");
  //     } else {
  //       return NetworkError("Something went wrong. Please try again.");
  //     }
  //   }
  // }
}
