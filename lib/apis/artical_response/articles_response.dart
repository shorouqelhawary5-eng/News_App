import 'dart:convert';
import 'article.dart';

ArticlesResponse articlesResponseFromJson(String str) =>
    ArticlesResponse.fromJson(json.decode(str) as Map<String, dynamic>);

class ArticlesResponse {
  final String? status;
  final int? totalResults;
  final List<Article>? articles;
  final String? message;
  final String? code;

  ArticlesResponse({
    this.status,
    this.totalResults,
    this.articles,
    this.message,
    this.code,
  });

  factory ArticlesResponse.fromJson(Map<String, dynamic> json) =>
      ArticlesResponse(
        status: json["status"] as String?,
        totalResults: json["totalResults"] as int?,
        message: json["message"] as String?,
        code: json["code"] as String?,
        articles: json["articles"] == null
            ? []
            : List<Article>.from(
                (json["articles"] as List<dynamic>).map(
                  (x) => Article.fromJson(x as Map<String, dynamic>),
                ),
              ),
      );
}
