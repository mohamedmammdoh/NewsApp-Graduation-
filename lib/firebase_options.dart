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
    apiKey: 'AIzaSyBRu24dtKxMckXV3z79dlLIwqvwkErZ15Q',
    appId: '1:641206235363:web:b147c01b078c626c9815d6',
    messagingSenderId: '641206235363',
    projectId: 'news-app-2948f',
    authDomain: 'news-app-2948f.firebaseapp.com',
    storageBucket: 'news-app-2948f.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyD2k_p1PHDxsmWBZj4ovWBpmtcvj02GsK8',
    appId: '1:641206235363:android:ce320ec095210cc39815d6',
    messagingSenderId: '641206235363',
    projectId: 'news-app-2948f',
    storageBucket: 'news-app-2948f.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCTT5JUrEBGQ-oufhzjB_cN5Gl8g9Tvr2Q',
    appId: '1:641206235363:ios:188b442616fcbd929815d6',
    messagingSenderId: '641206235363',
    projectId: 'news-app-2948f',
    storageBucket: 'news-app-2948f.appspot.com',
    iosBundleId: 'com.example.news',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCTT5JUrEBGQ-oufhzjB_cN5Gl8g9Tvr2Q',
    appId: '1:641206235363:ios:188b442616fcbd929815d6',
    messagingSenderId: '641206235363',
    projectId: 'news-app-2948f',
    storageBucket: 'news-app-2948f.appspot.com',
    iosBundleId: 'com.example.news',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyBRu24dtKxMckXV3z79dlLIwqvwkErZ15Q',
    appId: '1:641206235363:web:ac2341fc55333d2f9815d6',
    messagingSenderId: '641206235363',
    projectId: 'news-app-2948f',
    authDomain: 'news-app-2948f.firebaseapp.com',
    storageBucket: 'news-app-2948f.appspot.com',
  );
}