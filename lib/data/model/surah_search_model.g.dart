// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'surah_search_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SurahSearchModel _$SurahSearchModelFromJson(Map<String, dynamic> json) =>
    SurahSearchModel(
      code: (json['code'] as num).toInt(),
      status: json['status'] as String,
      data: SearchResult.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$SurahSearchModelToJson(SurahSearchModel instance) =>
    <String, dynamic>{
      'code': instance.code,
      'status': instance.status,
      'data': instance.data,
    };

SearchResult _$SearchResultFromJson(Map<String, dynamic> json) => SearchResult(
      count: (json['count'] as num).toInt(),
      SurahMatchResultes: (json['matches'] as List<dynamic>)
          .map((e) => SurahMatchResult.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$SearchResultToJson(SearchResult instance) =>
    <String, dynamic>{
      'count': instance.count,
      'matches': instance.SurahMatchResultes,
    };

SurahMatchResult _$SurahMatchResultFromJson(Map<String, dynamic> json) =>
    SurahMatchResult(
      number: (json['number'] as num).toInt(),
      text: json['text'] as String,
      edition: Edition.fromJson(json['edition'] as Map<String, dynamic>),
      surah: Surah.fromJson(json['surah'] as Map<String, dynamic>),
      numberInSurah: (json['numberInSurah'] as num).toInt(),
    );

Map<String, dynamic> _$SurahMatchResultToJson(SurahMatchResult instance) =>
    <String, dynamic>{
      'number': instance.number,
      'text': instance.text,
      'edition': instance.edition,
      'surah': instance.surah,
      'numberInSurah': instance.numberInSurah,
    };

Edition _$EditionFromJson(Map<String, dynamic> json) => Edition(
      identifier: json['identifier'] as String,
      language: json['language'] as String,
      name: json['name'] as String,
      englishName: json['englishName'] as String,
      type: json['type'] as String,
    );

Map<String, dynamic> _$EditionToJson(Edition instance) => <String, dynamic>{
      'identifier': instance.identifier,
      'language': instance.language,
      'name': instance.name,
      'englishName': instance.englishName,
      'type': instance.type,
    };

Surah _$SurahFromJson(Map<String, dynamic> json) => Surah(
      number: (json['number'] as num).toInt(),
      name: json['name'] as String,
      englishName: json['englishName'] as String,
      englishNameTranslation: json['englishNameTranslation'] as String,
      revelationType: json['revelationType'] as String,
    );

Map<String, dynamic> _$SurahToJson(Surah instance) => <String, dynamic>{
      'number': instance.number,
      'name': instance.name,
      'englishName': instance.englishName,
      'englishNameTranslation': instance.englishNameTranslation,
      'revelationType': instance.revelationType,
    };
