import 'package:json_annotation/json_annotation.dart';
part 'audio_model.g.dart';

@JsonSerializable()
class AudioModel {
  @JsonKey(name: "code")
  int code;
  @JsonKey(name: "status")
  String status;
  @JsonKey(name: "data")
  Data data;

  AudioModel({
    required this.code,
    required this.status,
    required this.data,
  });

  factory AudioModel.fromJson(Map<String, dynamic> json) =>
      _$AudioModelFromJson(json);

  Map<String, dynamic> toJson() => _$AudioModelToJson(this);
}

@JsonSerializable()
class Data {
  @JsonKey(name: "number")
  int number;
  @JsonKey(name: "name")
  String name;
  @JsonKey(name: "englishName")
  String englishName;
  @JsonKey(name: "englishNameTranslation")
  String englishNameTranslation;
  @JsonKey(name: "revelationType")
  String revelationType;
  @JsonKey(name: "numberOfAyahs")
  int numberOfAyahs;
  @JsonKey(name: "ayahs")
  List<Ayah> ayahs;
  @JsonKey(name: "edition")
  Edition edition;

  Data({
    required this.number,
    required this.name,
    required this.englishName,
    required this.englishNameTranslation,
    required this.revelationType,
    required this.numberOfAyahs,
    required this.ayahs,
    required this.edition,
  });

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

  Map<String, dynamic> toJson() => _$DataToJson(this);
}

@JsonSerializable()
class Ayah {
  @JsonKey(name: "number")
  int number;
  @JsonKey(name: "audio")
  String audio;
  @JsonKey(name: "audioSecondary")
  List<String> audioSecondary;
  @JsonKey(name: "text")
  String text;
  @JsonKey(name: "numberInSurah")
  int numberInSurah;
  @JsonKey(name: "juz")
  int juz;
  @JsonKey(name: "manzil")
  int manzil;
  @JsonKey(name: "page")
  int page;
  @JsonKey(name: "ruku")
  int ruku;
  @JsonKey(name: "hizbQuarter")
  int hizbQuarter;
  @JsonKey(name: "sajda")
  bool sajda;

  Ayah({
    required this.number,
    required this.audio,
    required this.audioSecondary,
    required this.text,
    required this.numberInSurah,
    required this.juz,
    required this.manzil,
    required this.page,
    required this.ruku,
    required this.hizbQuarter,
    required this.sajda,
  });

  factory Ayah.fromJson(Map<String, dynamic> json) => _$AyahFromJson(json);

  Map<String, dynamic> toJson() => _$AyahToJson(this);
}

@JsonSerializable()
class Edition {
  @JsonKey(name: "identifier")
  String identifier;
  @JsonKey(name: "language")
  String language;
  @JsonKey(name: "name")
  String name;
  @JsonKey(name: "englishName")
  String englishName;
  @JsonKey(name: "format")
  String format;
  @JsonKey(name: "type")
  String type;
  @JsonKey(name: "direction")
  dynamic direction;

  Edition({
    required this.identifier,
    required this.language,
    required this.name,
    required this.englishName,
    required this.format,
    required this.type,
    required this.direction,
  });

  factory Edition.fromJson(Map<String, dynamic> json) =>
      _$EditionFromJson(json);

  Map<String, dynamic> toJson() => _$EditionToJson(this);
}
