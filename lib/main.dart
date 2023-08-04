import 'package:assignment/Screens/list.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

import 'Screens/home.dart';
import 'Screens/login.dart';
import 'Screens/verify.dart';


void main() async {
  // Initialize Firebase before running the app
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Welcome(),
      routes: {
        'phone': (context) => MyPhone(),
        'verify': (context) => MyVerify(),
        'list': (context) => ListPage(),

      },
    );
  }
}
