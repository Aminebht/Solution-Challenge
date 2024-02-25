
import 'package:EducationALL/SignIn.dart';
import 'package:EducationALL/Home.dart';
import 'package:EducationALL/my_data_adapter.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:hive_flutter/adapters.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Hive.registerAdapter(MyDataAdapter());
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await Hive.initFlutter();
  await Hive.openBox('testBox');

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var box = Hive.box('testBox');
    if (box.isEmpty) {
      return MaterialApp(
        title: 'main',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: SignIn(),
      );
    } else {
      
      var myData = box.values.last;
      bool keepMeSignedIn = myData?.keepMeSignedIn ?? false;

      return MaterialApp(
        title: 'main',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: keepMeSignedIn ? const Home() : SignIn(),
      );
    }
  }
}
