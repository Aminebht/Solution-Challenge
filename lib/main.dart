import 'package:app_0/ChooseForm.dart';
import 'package:app_0/ChooseSubject.dart';
import 'package:app_0/SignIn.dart';
import 'package:app_0/Home.dart';
import 'package:app_0/Questions.dart';
import 'package:app_0/OneQuestion.dart';
import 'package:app_0/my_data_adapter.dart';
import 'package:app_0/my_data.dart';
import 'package:app_0/SignUp.dart';
import 'package:app_0/visualization.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Hive.registerAdapter(MyDataAdapter());
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await Hive.initFlutter();
  await Hive.openBox('testBox');

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
      home: keepSignedIn ? VisualizationWidget() : Home(),
    );
  }
}
