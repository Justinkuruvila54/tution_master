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
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
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
    apiKey: 'AIzaSyBXoo_3YwLU0j7sgEBTxya8Fi5O15nj0FM',
    appId: '1:1013336237530:web:b8e70b205df7c1072dcce3',
    messagingSenderId: '1013336237530',
    projectId: 'tution-master-ee844',
    authDomain: 'tution-master-ee844.firebaseapp.com',
    storageBucket: 'tution-master-ee844.appspot.com',
    measurementId: 'G-KR5LZN7FGN',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyB1Ah5uCkIBNVbLvmPIMBvzm3_LYE3oFak',
    appId: '1:1013336237530:android:e084391df7f2db202dcce3',
    messagingSenderId: '1013336237530',
    projectId: 'tution-master-ee844',
    storageBucket: 'tution-master-ee844.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCjh3qQZ0d6TYbL9AondZd5FrJFTYqhqU0',
    appId: '1:1013336237530:ios:1005bf4186203e6e2dcce3',
    messagingSenderId: '1013336237530',
    projectId: 'tution-master-ee844',
    storageBucket: 'tution-master-ee844.appspot.com',
    iosBundleId: 'com.example.tutionMaster',
  );
}