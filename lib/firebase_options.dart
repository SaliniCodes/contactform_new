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
    apiKey: 'AIzaSyCHveaWDTJi2q5sGh0w93hmy5sgJCv9Sio',
    appId: '1:75987828255:web:1441687a1930d68a721f2a',
    messagingSenderId: '75987828255',
    projectId: 'fir-home-866b3',
    authDomain: 'fir-home-866b3.firebaseapp.com',
    storageBucket: 'fir-home-866b3.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDUxT8Fn_KYUDlDGM8qcaUoLv97i-8QDSM',
    appId: '1:75987828255:android:fb0895e949740af0721f2a',
    messagingSenderId: '75987828255',
    projectId: 'fir-home-866b3',
    storageBucket: 'fir-home-866b3.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDDi_1zS7rc9KiSpWLtzMD_5m5Ur9jGiYM',
    appId: '1:75987828255:ios:7f22d89de58612fe721f2a',
    messagingSenderId: '75987828255',
    projectId: 'fir-home-866b3',
    storageBucket: 'fir-home-866b3.appspot.com',
    iosBundleId: 'com.example.contactform',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDDi_1zS7rc9KiSpWLtzMD_5m5Ur9jGiYM',
    appId: '1:75987828255:ios:1e058691487e5aec721f2a',
    messagingSenderId: '75987828255',
    projectId: 'fir-home-866b3',
    storageBucket: 'fir-home-866b3.appspot.com',
    iosBundleId: 'com.example.contactform.RunnerTests',
  );
}
