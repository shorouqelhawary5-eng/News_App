class Source {
  final String? id;
  final String? name;
  final String? description;
  final String? url;
  final Category? category;
  final String? language;
  final String? country;

  Source({
    this.id,
    this.name,
    this.description,
    this.url,
    this.category,
    this.language,
    this.country,
  });

  Source copyWith({
    String? id,
    String? name,
    String? description,
    String? url,
    Category? category,
    String? language,
    String? country,
  }) => Source(
    id: id ?? this.id,
    name: name ?? this.name,
    description: description ?? this.description,
    url: url ?? this.url,
    category: category ?? this.category,
    language: language ?? this.language,
    country: country ?? this.country,
  );

  factory Source.fromJson(Map<String, dynamic> json) => Source(
    id: json["id"] as String?,
    name: json["name"] as String?,
    description: json["description"] as String?,
    url: json["url"] as String?,
    category: json["category"] != null
        ? categoryValues.map[json["category"]]
        : null,
    language: json["language"] as String?,
    country: json["country"] as String?,
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "description": description,
    "url": url,
    "category": category != null ? categoryValues.reverse[category] : null,
    "language": language,
    "country": country,
  };
}

enum Category {
  BUSINESS,
  ENTERTAINMENT,
  GENERAL,
  HEALTH,
  SCIENCE,
  SPORTS,
  TECHNOLOGY,
}

final categoryValues = EnumValues({
  "business": Category.BUSINESS,
  "entertainment": Category.ENTERTAINMENT,
  "general": Category.GENERAL,
  "health": Category.HEALTH,
  "science": Category.SCIENCE,
  "sports": Category.SPORTS,
  "technology": Category.TECHNOLOGY,
});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
