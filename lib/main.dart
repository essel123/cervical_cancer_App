import 'dart:io';

import 'package:cervical_cancer_prediction/auth/login.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Platform.isAndroid
      ? await Firebase.initializeApp(
          options: const FirebaseOptions(
          apiKey: "AIzaSyADRRCJ2LFdOtebJ-4Pkl_RKvin1dvbAhY",
          authDomain: "cervical-cancer-c2f7c.firebaseapp.com",
          projectId: "cervical-cancer-c2f7c",
          storageBucket: "cervical-cancer-c2f7c.appspot.com",
          messagingSenderId: "356298566501",
          appId: "1:356298566501:web:b2f6c4d566ff2110144f8c",
          measurementId: "G-5GY9JP2BJ6",
        ))
      : await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: const Color.fromARGB(255, 244, 4, 172),
      ),
      debugShowCheckedModeBanner: false,
      home: const Login(),
    );
  }
}
