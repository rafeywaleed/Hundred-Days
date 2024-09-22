// File generated by FlutterFire CLI.
// ignore_for_file: type=lint
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
        return windows;
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
    apiKey: 'AIzaSyBd02jo2iHGaDPS0y7xTJRffDrnmHkLniw',
    appId: '1:447321335251:web:a443cae613c13e11fb3b26',
    messagingSenderId: '447321335251',
    projectId: 'hundred-days-1c861',
    authDomain: 'hundred-days-1c861.firebaseapp.com',
    storageBucket: 'hundred-days-1c861.appspot.com',
    measurementId: 'G-KK962HS13R',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCn_BXqYFprq0N-gQ0RQ5xTGQUiIHLCV3k',
    appId: '1:447321335251:android:1cb0a13dc856817dfb3b26',
    messagingSenderId: '447321335251',
    projectId: 'hundred-days-1c861',
    storageBucket: 'hundred-days-1c861.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCcCmE03HWLdQYksI8a_F8yBlt5EY700Gk',
    appId: '1:447321335251:ios:68229337dcc68b2efb3b26',
    messagingSenderId: '447321335251',
    projectId: 'hundred-days-1c861',
    storageBucket: 'hundred-days-1c861.appspot.com',
    iosBundleId: 'com.example.hundredDays',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCcCmE03HWLdQYksI8a_F8yBlt5EY700Gk',
    appId: '1:447321335251:ios:68229337dcc68b2efb3b26',
    messagingSenderId: '447321335251',
    projectId: 'hundred-days-1c861',
    storageBucket: 'hundred-days-1c861.appspot.com',
    iosBundleId: 'com.example.hundredDays',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyBd02jo2iHGaDPS0y7xTJRffDrnmHkLniw',
    appId: '1:447321335251:web:e3f710ce661ebc29fb3b26',
    messagingSenderId: '447321335251',
    projectId: 'hundred-days-1c861',
    authDomain: 'hundred-days-1c861.firebaseapp.com',
    storageBucket: 'hundred-days-1c861.appspot.com',
    measurementId: 'G-FS1144FCXB',
  );
}
