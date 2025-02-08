import 'package:json_annotation/json_annotation.dart';

part 'surah_search_model.g.dart';

@JsonSerializable()
class SurahSearchModel {
  @JsonKey(name: "code")
  final int code;
  @JsonKey(name: "status")
  final String status;
  @JsonKey(name: "data")
  final SearchResult data;

  SurahSearchModel({
    required this.code,
    required this.status,
    required this.data,
  });

  factory SurahSearchModel.fromJson(Map<String, dynamic> json) =>
      _$SurahSearchModelFromJson(json);

  Map<String, dynamic> toJson() => _$SurahSearchModelToJson(this);
}

@JsonSerializable()
class SearchResult {
  @JsonKey(name: "count")
  final int count;
  @JsonKey(name: "matches")
  final List<SurahMatchResult> SurahMatchResultes;

  SearchResult({
    required this.count,
    required this.SurahMatchResultes,
  });

  factory SearchResult.fromJson(Map<String, dynamic> json) =>
      _$SearchResultFromJson(json);

  Map<String, dynamic> toJson() => _$SearchResultToJson(this);
}

@JsonSerializable()
class SurahMatchResult {
  @JsonKey(name: "number")
  final int number;
  @JsonKey(name: "text")
  final String text;
  @JsonKey(name: "edition")
  final Edition edition;
  @JsonKey(name: "surah")
  final Surah surah;
  @JsonKey(name: "numberInSurah")
  final int numberInSurah;

  SurahMatchResult({
    required this.number,
    required this.text,
    required this.edition,
    required this.surah,
    required this.numberInSurah,
  });

  factory SurahMatchResult.fromJson(Map<String, dynamic> json) =>
      _$SurahMatchResultFromJson(json);

  Map<String, dynamic> toJson() => _$SurahMatchResultToJson(this);
}

@JsonSerializable()
class Edition {
  @JsonKey(name: "identifier")
  final String identifier;
  @JsonKey(name: "language")
  final String language;
  @JsonKey(name: "name")
  final String name;
  @JsonKey(name: "englishName")
  final String englishName;
  @JsonKey(name: "type")
  final String type;

  Edition({
    required this.identifier,
    required this.language,
    required this.name,
    required this.englishName,
    required this.type,
  });

  factory Edition.fromJson(Map<String, dynamic> json) =>
      _$EditionFromJson(json);

  Map<String, dynamic> toJson() => _$EditionToJson(this);
}

@JsonSerializable()
class Surah {
  @JsonKey(name: "number")
  final int number;
  @JsonKey(name: "name")
  final String name;
  @JsonKey(name: "englishName")
  final String englishName;
  @JsonKey(name: "englishNameTranslation")
  final String englishNameTranslation;
  @JsonKey(name: "revelationType")
  final String revelationType;

  Surah({
    required this.number,
    required this.name,
    required this.englishName,
    required this.englishNameTranslation,
    required this.revelationType,
  });

  factory Surah.fromJson(Map<String, dynamic> json) => _$SurahFromJson(json);

  Map<String, dynamic> toJson() => _$SurahToJson(this);
}
