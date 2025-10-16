
import 'package:flutter/material.dart';

import 'package:grocery_app/screens/splashscreen.dart';


void main()async {

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(scaffoldBackgroundColor: Colors.white),
      home: Splashscreen(),
    );
  }
}