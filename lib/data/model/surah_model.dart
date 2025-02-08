import 'package:json_annotation/json_annotation.dart';

part 'surah_model.g.dart';

@JsonSerializable()
class SurahModel {
  @JsonKey(name: "code")
  final int code;
  @JsonKey(name: "status")
  final String status;
  @JsonKey(name: "data")
  final List<SurahModelData> data;

  SurahModel({
    required this.code,
    required this.status,
    required this.data,
  });

  factory SurahModel.fromJson(Map<String, dynamic> json) =>
      _$SurahModelFromJson(json);

  Map<String, dynamic> toJson() => _$SurahModelToJson(this);
}

@JsonSerializable()
class SurahModelData {
  @JsonKey(name: "number")
  final int number;
  @JsonKey(name: "name")
  final String name;
  @JsonKey(name: "englishName")
  final String englishName;
  @JsonKey(name: "englishNameTranslation")
  final String englishNameTranslation;
  @JsonKey(name: "numberOfAyahs")
  final int numberOfAyahs;
  @JsonKey(name: "revelationType")
  final String revelationType;

  SurahModelData({
    required this.number,
    required this.name,
    required this.englishName,
    required this.englishNameTranslation,
    required this.numberOfAyahs,
    required this.revelationType,
  });

  factory SurahModelData.fromJson(Map<String, dynamic> json) =>
      _$SurahModelDataFromJson(json);

  Map<String, dynamic> toJson() => _$SurahModelDataToJson(this);
}
