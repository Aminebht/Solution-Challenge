// NextPage.dart
import 'package:http/http.dart' as http;
import 'dart:convert';
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

Future<void> fetchProblem() async {
  final String apiUrl =
      'http://your-django-api-url/api/problem-search/?count=1&category=Sample&score=3';

  try {
    final response = await http.get(Uri.parse(apiUrl));

    if (response.statusCode == 200) {
      final Map<String, dynamic> data = json.decode(response.body);
      // Process the data as needed
      print('Problem ID: ${data['id']}');
      print('Problem: ${data['problem']}');
      print('Rationale: ${data['rationale']}');
    } else {
      // Handle errors
      print('Error: ${response.statusCode}');
    }
  } catch (error) {
    // Handle network or other errors
    print('Error: $error');
  }
}
