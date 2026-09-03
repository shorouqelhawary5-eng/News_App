import 'dart:convert';
import 'source.dart';

SourcesResponse sourcesResponseFromJson(String str) =>
    SourcesResponse.fromJson(json.decode(str) as Map<String, dynamic>);

String sourcesResponseToJson(SourcesResponse data) =>
    json.encode(data.toJson());

class SourcesResponse {
  final String? status;
  final List<Source>? sources;

  SourcesResponse({this.status, this.sources});

  SourcesResponse copyWith({String? status, List<Source>? sources}) =>
      SourcesResponse(
        status: status ?? this.status,
        sources: sources ?? this.sources,
      );

  factory SourcesResponse.fromJson(Map<String, dynamic> json) =>
      SourcesResponse(
        status: json["status"] as String?,
        sources: json["sources"] == null
            ? []
            : List<Source>.from(
                (json["sources"] as List<dynamic>).map(
                  (x) => Source.fromJson(x as Map<String, dynamic>),
                ),
              ),
      );

  Map<String, dynamic> toJson() => {
    "status": status,
    "sources": sources == null
        ? []
        : List<dynamic>.from(sources!.map((x) => x.toJson())),
  };
}
