import 'package:app_0/Answers.dart';
import 'package:app_0/ChooseForm.dart';
import 'package:app_0/ChooseSubject.dart';
import 'package:app_0/SignIn.dart';
import 'package:app_0/Home.dart';
import 'package:app_0/Questions.dart';
import 'package:app_0/OneQuestion.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool keepSignedIn = true;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'main',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: keepSignedIn ? Answers() : Home(),
    );
  }
}
