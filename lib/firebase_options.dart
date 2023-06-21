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
    apiKey: 'AIzaSyDfEZkKOJ7z7QTbukcM_ZgjR9X1EwnGxXo',
    appId: '1:348762098596:web:8a6687ab0696ac8d204f31',
    messagingSenderId: '348762098596',
    projectId: 'chat-app-c451d',
    authDomain: 'chat-app-c451d.firebaseapp.com',
    storageBucket: 'chat-app-c451d.appspot.com',
    measurementId: 'G-2NGH21JHWB',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyB6KQi08bv7CqJnEspzgbwEtmlF1tuRXZ8',
    appId: '1:348762098596:android:1645097661f476fe204f31',
    messagingSenderId: '348762098596',
    projectId: 'chat-app-c451d',
    storageBucket: 'chat-app-c451d.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAnaQibz8amsCQsBbRZhViJqzXQXJCpImM',
    appId: '1:348762098596:ios:df170e6a96e7a0cf204f31',
    messagingSenderId: '348762098596',
    projectId: 'chat-app-c451d',
    storageBucket: 'chat-app-c451d.appspot.com',
    androidClientId: '348762098596-s711feglrt7pprbq9mm2tv82hn0cveae.apps.googleusercontent.com',
    iosClientId: '348762098596-lnqebuak12c73223vaghufgqocdofg1k.apps.googleusercontent.com',
    iosBundleId: 'com.example.chatApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAnaQibz8amsCQsBbRZhViJqzXQXJCpImM',
    appId: '1:348762098596:ios:df170e6a96e7a0cf204f31',
    messagingSenderId: '348762098596',
    projectId: 'chat-app-c451d',
    storageBucket: 'chat-app-c451d.appspot.com',
    androidClientId: '348762098596-s711feglrt7pprbq9mm2tv82hn0cveae.apps.googleusercontent.com',
    iosClientId: '348762098596-lnqebuak12c73223vaghufgqocdofg1k.apps.googleusercontent.com',
    iosBundleId: 'com.example.chatApp',
  );
}
