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
    apiKey: 'AIzaSyC2GT1KGj0ZOBYAIzwwMR9azrAEQ6YxVBQ',
    appId: '1:699828636540:web:5a34633e9a129b4b32f2f9',
    messagingSenderId: '699828636540',
    projectId: 'rest-2d4c9',
    authDomain: 'rest-2d4c9.firebaseapp.com',
    storageBucket: 'rest-2d4c9.appspot.com',
    measurementId: 'G-NW6PN45SM9',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBBdoa-AJJA3qq2EaCNLpT1FvGchpao7wM',
    appId: '1:699828636540:android:d0634a5ccb190f8f32f2f9',
    messagingSenderId: '699828636540',
    projectId: 'rest-2d4c9',
    storageBucket: 'rest-2d4c9.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAhqbOpU-phuOy1R3eBcv8r1zTijEDjOKw',
    appId: '1:699828636540:ios:7b25bc6d1666910d32f2f9',
    messagingSenderId: '699828636540',
    projectId: 'rest-2d4c9',
    storageBucket: 'rest-2d4c9.appspot.com',
    iosBundleId: 'com.example.restaurant',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAhqbOpU-phuOy1R3eBcv8r1zTijEDjOKw',
    appId: '1:699828636540:ios:042ef81fe100e95d32f2f9',
    messagingSenderId: '699828636540',
    projectId: 'rest-2d4c9',
    storageBucket: 'rest-2d4c9.appspot.com',
    iosBundleId: 'com.example.restaurant.RunnerTests',
  );
}
