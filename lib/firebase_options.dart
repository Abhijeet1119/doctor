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
    apiKey: 'AIzaSyDw67iJzaxWVjzRwqnLxx7DZe1ST2g3LJw',
    appId: '1:1019824247748:web:e9c33c843e43fe860b4a91',
    messagingSenderId: '1019824247748',
    projectId: 'doctor-877cd',
    authDomain: 'doctor-877cd.firebaseapp.com',
    storageBucket: 'doctor-877cd.appspot.com',
    measurementId: 'G-EBXX182H10',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBUXMS8h9hHMkNaw8GnjyI_RzQQxqkyTpw',
    appId: '1:1019824247748:android:607b99d9d32fbc730b4a91',
    messagingSenderId: '1019824247748',
    projectId: 'doctor-877cd',
    storageBucket: 'doctor-877cd.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyC7cFsi7TcsQsqWJO2Zzyl4D6h2jgU_JoE',
    appId: '1:1019824247748:ios:8a76c28d7a3053580b4a91',
    messagingSenderId: '1019824247748',
    projectId: 'doctor-877cd',
    storageBucket: 'doctor-877cd.appspot.com',
    iosClientId: '1019824247748-ml1pbbojb1icjsrgll416l4lrcuf2o9k.apps.googleusercontent.com',
    iosBundleId: 'com.example.flutterapp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyC7cFsi7TcsQsqWJO2Zzyl4D6h2jgU_JoE',
    appId: '1:1019824247748:ios:8a76c28d7a3053580b4a91',
    messagingSenderId: '1019824247748',
    projectId: 'doctor-877cd',
    storageBucket: 'doctor-877cd.appspot.com',
    iosClientId: '1019824247748-ml1pbbojb1icjsrgll416l4lrcuf2o9k.apps.googleusercontent.com',
    iosBundleId: 'com.example.flutterapp',
  );
}
