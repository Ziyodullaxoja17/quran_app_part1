import 'dart:convert';
import 'dart:developer';

import 'package:flutter_46home/data/model/audio_model.dart';
import 'package:flutter_46home/data/model/surah_model.dart';
import 'package:flutter_46home/data/model/surah_search_model.dart';
import 'package:flutter_46home/data/repository/network_constant.dart';
import 'package:http/http.dart' as http;

class QuranAppRepo {
  Future<SurahModel?> getSurahs() async {
    final url = Uri.parse(NetworkConstant.getSurahUrl);

    try {
      final response = await http.get(url);
      final result = jsonDecode(response.body);

      return SurahModel.fromJson(result);
    } catch (e) {
      log("ma'lumotlarni olishda xatolikga duch kelindi");

      throw Exception(e);
    }
  }

  Future<SurahSearchModel?> getSearchResult({required String pattern}) async {
    final url = Uri.parse("${NetworkConstant.searchSurah}/${pattern}/all/en");

    try {
      final response = await http.get(url);

      final resutl = jsonDecode(response.body);

      return SurahSearchModel.fromJson(resutl);
    } catch (e) {
      log("mos pattern topishda xatolik yuz berdi");
      throw Exception(e);
    }
  }

  Future<AudioModel?> getSurahDetailAudio({required int number}) async {
    final url = "https://api.alquran.cloud/v1/surah/$number/ar.alafasy";
    final resultUrl = Uri.parse(url);

    try {
      final response = await http.get(resultUrl);
      if (response.statusCode == 200) {
        final result = jsonDecode(response.body);
        log(result);

        return AudioModel.fromJson(result);
      }

      log("audio repoda ma'lumotlarni olishda xatolik yuzaga keldi");
      log("status code  =>${response.statusCode}");
    } catch (e) {
      log(e.toString());
      throw Exception(e);
    }
    return null;
  }
}
