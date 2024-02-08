// user_info_widget.dart
import 'package:flutter/material.dart';
import 'my_data.dart';

class UserInfoWidget extends StatelessWidget {
  final MyData userData;

  const UserInfoWidget({required this.userData});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('User ID: ${userData.userId}'),
        Text('Keep Me Signed In: ${userData.keepMeSignedIn ? 'Yes' : 'No'}'),
        Text('User Scores:'),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: userData.userScores.entries
              .map((entry) => Text('${entry.key}: ${entry.value}'))
              .toList(),
        ),
      ],
    );
  }
}
