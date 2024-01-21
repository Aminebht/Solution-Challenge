// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        return macos;
      case TargetPlatform.windows:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyB_9umlPZ63POI_lsXhohMLUcpgay5LQxY',
    appId: '1:8200480371:web:2bf3554a5ea4ba698a2c06',
    messagingSenderId: '8200480371',
    projectId: 'solutionchallenge-ceee2',
    authDomain: 'solutionchallenge-ceee2.firebaseapp.com',
    storageBucket: 'solutionchallenge-ceee2.appspot.com',
    measurementId: 'G-NX7GTQBJPK',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBy275NN-i3N8fxu2OXdPJWBRTFRdlivCY',
    appId: '1:8200480371:android:e78e4c48efc45e758a2c06',
    messagingSenderId: '8200480371',
    projectId: 'solutionchallenge-ceee2',
    storageBucket: 'solutionchallenge-ceee2.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCY1yLs-zhOuTCVi1zHIvMynPGVn0eLWm4',
    appId: '1:8200480371:ios:04e48aae56d1eff38a2c06',
    messagingSenderId: '8200480371',
    projectId: 'solutionchallenge-ceee2',
    storageBucket: 'solutionchallenge-ceee2.appspot.com',
    iosClientId: '8200480371-lo8rn1supfpaguedroi8hngchm7k93m0.apps.googleusercontent.com',
    iosBundleId: 'com.example.app0',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCY1yLs-zhOuTCVi1zHIvMynPGVn0eLWm4',
    appId: '1:8200480371:ios:ed5ac44d7065d9f68a2c06',
    messagingSenderId: '8200480371',
    projectId: 'solutionchallenge-ceee2',
    storageBucket: 'solutionchallenge-ceee2.appspot.com',
    iosClientId: '8200480371-o1hvudg5i6hp65ph8gu3l4gjtuidl4k8.apps.googleusercontent.com',
    iosBundleId: 'com.example.app0.RunnerTests',
  );
}