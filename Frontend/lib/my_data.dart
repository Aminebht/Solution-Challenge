// my_data.dart
class MyData {
  final String userId;
  final Map<String, dynamic> userScores;
  bool keepMeSignedIn; // Remove the final keyword

  MyData({
    required this.userId,
    required this.userScores,
    required this.keepMeSignedIn,
  });

  // A method to update keepMeSignedIn
  void updateKeepMeSignedIn(bool newKeepMeSignedIn) {
    this.keepMeSignedIn = newKeepMeSignedIn;
  }
}
