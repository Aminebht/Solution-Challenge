// api_urls.dart

class APIUrls {
  static const String baseUrl = 'https://d733-165-51-105-191.ngrok-free.app';
  static const String baseUrlAi='https://e3f8-165-51-105-191.ngrok-free.app';
  static const String AiUrl = '$baseUrlAi/predict';
  static const String problemsearchURL ='/api/get-problems-by-score/'; //'/api/get-problems-by-score/';
  static const String userstatsURL = '$baseUrl/api/user/stats';
  static const String userscoresURL = '$baseUrl/api/user/scores/';
  static const String userhistoryURL = '$baseUrl/api/user/history/';
  static const String userDataUrl = '$baseUrl/api/user';
}
