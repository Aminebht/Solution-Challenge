// api_urls.dart

class APIUrls {
  static const String baseUrl = 'http://10.0.2.2:8000';
  static const String baseUrlAi='http://10.0.2.2:8001';
  static const String AiUrl = '$baseUrlAi/predict';
  static const String problemsearchURL ='/api/problem-search/';
  static const String userstatsURL = '$baseUrl/api/user/stats';
  static const String userscoresURL = '$baseUrl/api/user/scores/';
  static const String userhistoryURL = '$baseUrl/api/user/history/';
  static const String userDataUrl = '$baseUrl/api/user';
}
