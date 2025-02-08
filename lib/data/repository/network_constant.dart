class NetworkConstant {
  // base url
  static const String baseUrl = "https://api.alquran.cloud/v1";

  // get surah url

  static const String getSurahUrl = "$baseUrl/surah";

  // get search with input text
  // example =>
  // https://api.alquran.cloud/v1/search/Abraham/all/en
  static const String searchSurah = "$baseUrl/search";
}
