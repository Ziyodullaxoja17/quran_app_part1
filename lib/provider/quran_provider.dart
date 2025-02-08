import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_46home/data/model/surah_model.dart';
import 'package:flutter_46home/data/repository/quran_app_repo.dart';
import 'package:just_audio/just_audio.dart';

class QuranProvider extends ChangeNotifier {
  final QuranAppRepo quranAppRepo;

  QuranProvider({required this.quranAppRepo});

  bool isloading = false;

  // suralar uchun maxsus list
  List<SurahModelData> surahs = [];
  // List<SurahMatchResult> matchSurahs = [];
  int count = 0;
  // suralar audio uchun maxsus funksiya
  List<AudioSource>? ayahsAudios = [];

// barcha suralarni olish uchun maxsus funksiya
  Future<void> fetchSurah() async {
    try {
      isloading = true;
      notifyListeners();
      final result = await quranAppRepo.getSurahs();

      surahs = result?.data ?? [];
      log("providerda ma'lumotlar olindi");
      log("data => $surahs");
    } catch (e) {
      log("providerda barcha ma'lumotlarni olishda xatolik yuz berdi");
      throw Exception(e);
    }
    isloading = false;
    notifyListeners();
  }

// providermda mos ma'lumotlarni topish uchun ishlatilinadi
  // Future<void> getMatchSurahByPattern({required String pattern}) async {
  //   try {
  //     isloading = true;
  //     notifyListeners();
  //     final result = await quranAppRepo.getSearchResult(pattern: pattern);
  //     matchSurahs = result?.data.SurahMatchResultes ?? [];
  //     count = result?.data.count ?? 0;
  //   } catch (e) {
  //     log("providerda mos ma'lumotlarni olishda xatolik yuz berdi");
  //     throw Exception(e);
  //   }
  //   isloading = false;
  //   notifyListeners();
  // }

  Future<void> getAudio({required int number}) async {
    final response = await quranAppRepo.getSurahDetailAudio(number: number);

    if (response != null) {
      final result = response.data.ayahs;

      // Ensure the list is initialized before adding elements
      ayahsAudios ??= [];

      // Correctly add items to the list
      for (var audio in result) {
        ayahsAudios!.add(AudioSource.uri(Uri.parse(audio.audio.toString())));
      }

      log("Ayahs audios successfully fetched and added");

      // Notify UI about the change if this is inside a ChangeNotifier class
      notifyListeners();
    } else {
      log("Failed to fetch audio data");
    }
  }
}
