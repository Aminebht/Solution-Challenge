import 'package:EducationALL/ChooseForm.dart';
import 'package:EducationALL/ChooseSubject.dart';
import 'package:EducationALL/Profile.dart';
import 'package:EducationALL/SignIn.dart';
import 'package:EducationALL/Home.dart';
//import 'package:EducationALL/Profile.dart';
import 'package:EducationALL/Questions.dart';
import 'package:EducationALL/OneQuestion.dart';
import 'package:EducationALL/my_data_adapter.dart';
import 'package:EducationALL/my_data.dart';
import 'package:EducationALL/SignUp.dart';
import 'package:EducationALL/visualization.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:hive/hive.dart';
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
    // Retrieve the box
    var box = Hive.box('testBox');

    // Check if the box is empty
    if (box.isEmpty) {
      // Box is empty, set keepMeSignedIn to false
      bool keepMeSignedIn = false;
      print('Keep Me Signed In: $keepMeSignedIn');

      return MaterialApp(
        title: 'main',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: SignIn(),
      );
    } else {
      // Box is not empty, get the value of keepMeSignedIn for the first user
      var myData = box.values.last;
      bool keepMeSignedIn = myData?.keepMeSignedIn ?? false;
      print('Keep Me Signed In: $keepMeSignedIn');
      print(myData?.userId);

      return MaterialApp(
        title: 'main',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: keepMeSignedIn ? Home() : SignIn(),
      );
    }
  }
}
