// api_urls.dart

class APIUrls {
  static const String baseUrl = 'http://127.0.0.1:8000';
  static const String problemsearchURL =
      '/api/problem-search/'; //'/api/get-problems-by-score/';
  static const String userstatsURL = '$baseUrl/api/user/stats';
  static const String userscoresURL = '$baseUrl/api/user/scores/';
  static const String userhistoryURL = '$baseUrl/api/user/history/';
  static const String userDataUrl = '$baseUrl/api/user';
}
