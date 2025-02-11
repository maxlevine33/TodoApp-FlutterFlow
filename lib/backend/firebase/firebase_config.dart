import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: "AIzaSyBK1HMv6QfZjeq9_KoUQR-10ECsyrarxiM",
            authDomain: "todo-a-pp-rzih28.firebaseapp.com",
            projectId: "todo-a-pp-rzih28",
            storageBucket: "todo-a-pp-rzih28.firebasestorage.app",
            messagingSenderId: "192277578793",
            appId: "1:192277578793:web:6fd5358c765bc530c78838"));
  } else {
    await Firebase.initializeApp();
  }
}
