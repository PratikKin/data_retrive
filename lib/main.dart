import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'HomePage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Define your Firebase project configuration
  final FirebaseOptions firebaseConfig = FirebaseOptions(
    apiKey: "AIzaSyAoLxbaKw0HnJTuJh1jrqCTjc_JOof_l1Q",
    appId: "1:461001808593:android:ae7952d85a6fa0116a43f0",
    messagingSenderId: "461001808593",
    projectId: "data-recieve-1f209",
  );

  await Firebase.initializeApp(options: firebaseConfig);

  runApp(MyApp());
}

@immutable
class MyApp extends StatelessWidget {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(),
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
