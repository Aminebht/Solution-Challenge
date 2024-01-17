// NextPage.dart

import 'package:flutter/material.dart';

class NextPage extends StatelessWidget {
  final int selectedChoice;
  final int selectedOption;

  const NextPage({
    Key? key,
    required this.selectedChoice,
    required this.selectedOption,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Next Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Selected Choice on Next Page: $selectedChoice'),
            Text('Selected Option on Next Page: $selectedOption'),
          ],
        ),
      ),
    );
  }
}
