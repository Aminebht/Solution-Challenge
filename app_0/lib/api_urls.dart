// api_urls.dart

class APIUrls {
  static const String baseUrl = 'http://127.0.0.1:8000/api';
  //'https://7b22-196-235-36-113.ngrok-free.app/api'; //https://7b22-196-235-36-113.ngrok-free.app/api//
  static const String problemsearchURL = '/problem-search/';
  static const String userstatsURL = '$baseUrl/user/stats';
  static const String userscoresURL = '$baseUrl/user/scores';
  static const String userhistoryURL = '$baseUrl/user/history';
  static const String userDataUrl = '$baseUrl/user';

  // Add more URLs as needed
}
