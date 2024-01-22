// my_data.dart
class MyData {
  final String userId;
  final Map<String, int> userScores;
  final bool keepMeSignedIn;

  MyData({
    required this.userId,
    required this.userScores,
    required this.keepMeSignedIn,
  });
}
