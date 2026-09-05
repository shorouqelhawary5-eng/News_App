import 'dart:convert';
import 'source.dart';

SourcesResponse sourcesResponseFromJson(String str) =>
    SourcesResponse.fromJson(json.decode(str) as Map<String, dynamic>);

class SourcesResponse {
  final String? status;
  final List<Source>? sources;
  final String? error;
  final String? errorCode;

  SourcesResponse({this.status, this.sources, this.error, this.errorCode});

  factory SourcesResponse.fromJson(Map<String, dynamic> json) =>
      SourcesResponse(
        error: json["error"],
        errorCode: json["errorCode"],
        status: json["status"] as String?,
        sources: json["sources"] == null
            ? []
            : List<Source>.from(
                (json["sources"] as List<dynamic>).map(
                  (x) => Source.fromJson(x as Map<String, dynamic>),
                ),
              ),
      );
}
