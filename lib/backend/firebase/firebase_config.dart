import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: "AIzaSyAWAnHVYnCi38bs0iHq9AUEA4hmM8aj4PI",
            authDomain: "safenest-20df7.firebaseapp.com",
            projectId: "safenest-20df7",
            storageBucket: "safenest-20df7.appspot.com",
            messagingSenderId: "961552547639",
            appId: "1:961552547639:web:3411c9de6c753a8ad6a4b2",
            measurementId: "G-FS5697SPDR"));
  } else {
    await Firebase.initializeApp();
  }
}
