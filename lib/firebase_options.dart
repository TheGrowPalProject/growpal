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
    apiKey: 'AIzaSyD914gh-I_kSzjHWIKaliYPl7PBLvOlM2c',
    appId: '1:648350481554:web:96f841b4f6ecbe0a05fa4b',
    messagingSenderId: '648350481554',
    projectId: 'growpaltech',
    authDomain: 'growpaltech.firebaseapp.com',
    storageBucket: 'growpaltech.appspot.com',
    measurementId: 'G-WL4Y72QZ1G',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCo-Z0pY-88w4FnN2GoZhuKz8OqbJRe0Tg',
    appId: '1:648350481554:android:6d1745c07e57679c05fa4b',
    messagingSenderId: '648350481554',
    projectId: 'growpaltech',
    storageBucket: 'growpaltech.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCrXougwrMEbvYNBDfOetlDA9XXglZVlL0',
    appId: '1:648350481554:ios:69e86de38fe957c805fa4b',
    messagingSenderId: '648350481554',
    projectId: 'growpaltech',
    storageBucket: 'growpaltech.appspot.com',
    androidClientId:
        '648350481554-no8lc3ihan5869ek9odej43reuhhasv9.apps.googleusercontent.com',
    iosClientId:
        '648350481554-cpp36r43c6sa3mio9cnobjrtof5k7ctg.apps.googleusercontent.com',
    iosBundleId: 'com.example.growpalHackathon',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCrXougwrMEbvYNBDfOetlDA9XXglZVlL0',
    appId: '1:648350481554:ios:69e86de38fe957c805fa4b',
    messagingSenderId: '648350481554',
    projectId: 'growpaltech',
    storageBucket: 'growpaltech.appspot.com',
    androidClientId:
        '648350481554-no8lc3ihan5869ek9odej43reuhhasv9.apps.googleusercontent.com',
    iosClientId:
        '648350481554-cpp36r43c6sa3mio9cnobjrtof5k7ctg.apps.googleusercontent.com',
    iosBundleId: 'com.example.growpalHackathon',
  );
}
