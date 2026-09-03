import 'dart:convert';
import 'article.dart';

ArticlesResponse articlesResponseFromJson(String str) =>
    ArticlesResponse.fromJson(json.decode(str) as Map<String, dynamic>);

String articlesResponseToJson(ArticlesResponse data) =>
    json.encode(data.toJson());

class ArticlesResponse {
  final String? status;
  final int? totalResults;
  final List<Article>? articles;

  ArticlesResponse({this.status, this.totalResults, this.articles});

  factory ArticlesResponse.fromJson(Map<String, dynamic> json) =>
      ArticlesResponse(
        status: json["status"] as String?,
        totalResults: json["totalResults"] as int?,
        articles: json["articles"] == null
            ? []
            : List<Article>.from(
                (json["articles"] as List<dynamic>).map(
                  (x) => Article.fromJson(x as Map<String, dynamic>),
                ),
              ),
      );

  Map<String, dynamic> toJson() => {
    "status": status,
    "totalResults": totalResults,
    "articles": articles == null
        ? []
        : List<dynamic>.from(articles!.map((x) => x.toJson())),
  };
}
